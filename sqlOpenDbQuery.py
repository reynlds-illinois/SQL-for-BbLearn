# this script will allow you to connect to Bb OpenDB and run a multi-line query
# directly from the CLI...I wrap it in a shell script to initiate it using a
# python virtual environment

import cx_Oracle, os, sys, urllib3
from datetime import date
sys.path.append('/services/ic-tools/bin')
from icFunctions import envDict  # function to parse environment file
from pprint import pprint

def connect2Sql(dbUser, dbPass, dbHost, dbPort, dbSid):
    '''connect to the OpenDB instance'''
    import cx_Oracle, sys
    oraConn = cx_Oracle.connect('%s/%s@%s:%s/%s' % (dbUser, dbPass, dbHost, dbPort, dbSid))
    cursor = oraConn.cursor()
    return cursor

def sqlInput():
    '''prompt for multi-line input to query OpenDB'''
    print("Enter/Paste your content. Ctrl-D or Ctrl-Z ( windows ) to save it.")
    contents = []
    while True:
        try:
            line = input()
        except EOFError:
            break
        contents.append(line)
    print('Starting query...')
    strJoin = " ".join(contents)
    return str(strJoin)

# parse environment file for connection bits
envDict = getEnv()

# configure DB connection info
dbUser = envDict['ic2gprod.db.opendb.user']
dbPass = envDict['ic2gprod.db.opendb.pass']
dbHost = envDict['ic2gprod.db.opendb.sys']
dbPort = envDict['ic2gprod.db.opendb.port']
dbSid = envDict['ic2gprod.db.opendb.sid']

# create connection cursor
cursor = connect2Sql(envDict['ic2gprod.db.opendb.user'],
                     envDict['ic2gprod.db.opendb.pass'],
                     envDict['ic2gprod.db.opendb.sys'],
                     envDict['ic2gprod.db.opendb.port'],
                     envDict['ic2gprod.db.opendb.sid'])

# prompt for SQL input
tmpSql = sqlInput()

# execute SQL query
cursor.execute(tmpSql)

# retrieve column headers
headers = [i[0] for i in cursor.description]

# retrieve all results
r = cursor.fetchall()

# count results
records = len(r)

# display the first 10 lines plus headers
# can expand this to export to file, etc.
print('The search has returned', records, 'results. Here are the first 10: ')
print(headers)
pprint(r[:10])

cursor.close()
