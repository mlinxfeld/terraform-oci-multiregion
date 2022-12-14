# flask_ATP.py

from config import app
import os
import socket
import cx_Oracle

@app.route('/')
def oracleatpcheck():
     os.environ['TNS_ADMIN'] = '/usr/lib/oracle/${oracle_instant_client_version_short}/client64/lib/network/admin'
     connection = cx_Oracle.connect('admin', '${ATP_password}', '${ATP_alias}')
     cursor = connection.cursor()
     rs = cursor.execute("select name from v$database")
     dbname = rs.fetchone()
     cursor.close()
     connection.close()
          
     return 'FoggyKitchen.com: Here is OCI ATP name v$database: {}'.format(dbname[0])

if __name__ == "__main__":
    app.run()