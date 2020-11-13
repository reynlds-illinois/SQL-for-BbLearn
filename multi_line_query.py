import cx_Oracle
from pprint import pprint

def connect2Sql(dbUser, dbPass, dbHost, dbPort, dbSid):
    import cx_Oracle, sys
    oraConn = cx_Oracle.connect('%s/%s@%s:%s/%s' % (dbUser, dbPass, dbHost, dbPort, dbSid))
    cursor = oraConn.cursor()
    return cursor

def sqlInput():
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

# create connection cursor
cursor = connect2Sql(dbUser, dbPass, dbHost, dbPort, dbSid)

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

print('The search has returned', records, 'results. Here are the first 10: ')

print(headers)
pprint(r[:10])

cursor.close()
