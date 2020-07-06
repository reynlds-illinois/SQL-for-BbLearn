import cx_Oracle
from pprint import pprint

def connect2Sql(dbUser, dbPass, dbHost, dbPort, dbSid):
    '''create a connection to a SQL database'''
    import cx_Oracle, sys
    oraConn = cx_Oracle.connect('%s/%s@%s:%s/%s' % (dbUser, dbPass, dbHost, dbPort, dbSid))
    cursor = oraConn.cursor()
    return cursor

def sqlInput():
    '''prompt for multi-line input to query an Oracle DB'''
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

def getEnv(envConfFilePath='/path/to/my/configuration.file'):
    '''return credentials and connection info from environment file'''
    envConfFile = open(envConfFilePath)
    envDict = dict()
    blankCount = 0
    hashCount = 0
    lineCount = 0
    for line in envConfFile:
        if line.strip() == '':
            blankCount = blankCount + 1
        elif line.startswith('#'):
            hashCount = hashCount + 1
        else:
            lineR = line.rstrip()
            lineTmp = lineR.split('=', 1)
            keyTmp = lineTmp[0]
            valTmp = lineTmp[1]
            envDict[keyTmp] = valTmp
            lineCount = lineCount + 1
    return envDict

# parse environment file
envDict = getEnv()

# create connection cursor
cursor = connect2Sql(envDict['ic2gprod.db.opendb.user'],
                     envDict['ic2gprod.db.opendb.pass'],
                     envDict['ic2gprod.db.opendb.sys'],
                     envDict['ic2gprod.db.opendb.port'],
                     envDict['ic2gprod.db.opendb.sid'])

# prompt for SQL input
inputSql = sqlInput()

# execute SQL query
cursor.execute(inputSql)

# retrieve column headers
headers = [i[0] for i in cursor.description]

# retrieve all results
r = cursor.fetchall()

# count results
records = len(r)

print('The search has returned', records, 'results. Here are the first 10: ')

print(headers)
#print(r[0])
pprint(r[:10])

cursor.close()

