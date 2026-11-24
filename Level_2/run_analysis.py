"""Run from anywhere with Python 3. Uses only the standard library."""
from pathlib import Path
import csv, sqlite3
base=Path(__file__).resolve().parents[1]
con=sqlite3.connect(base/'Level_2/Analysis.sqlite')
with (base/'Level_1/Cleaned_Dataset.csv').open(newline='',encoding='utf-8') as f:
 reader=csv.DictReader(f); columns=reader.fieldnames
 numeric={'sales':'REAL','quantity':'INTEGER','discount':'REAL','profit':'REAL','shipping_cost':'REAL','year':'INTEGER','profit_missing':'INTEGER'}
 con.execute('DROP TABLE IF EXISTS orders')
 con.execute('CREATE TABLE orders ('+', '.join('"'+c+'" '+numeric.get(c,'TEXT') for c in columns)+')')
 rows=[]
 for r in reader:
  rows.append([None if r[c]=='' else (float(r[c]) if numeric.get(c)=='REAL' else int(r[c]) if numeric.get(c)=='INTEGER' else r[c]) for c in columns])
 con.executemany('INSERT INTO orders VALUES ('+','.join('?' for _ in columns)+')',rows);con.commit()
text=(base/'Level_2/SQL_Queries.sql').read_text()
for section in text.split('-- ')[1:]:
 lines=section.splitlines();name=lines[0].strip();q='\n'.join(lines[1:]).strip()
 if not name[:2].isdigit() or not q:continue
 cur=con.execute(q)
 with (base/'Level_2'/f'{name}.csv').open('w',newline='',encoding='utf-8') as f:
  w=csv.writer(f);w.writerow([x[0] for x in cur.description]);w.writerows(cur.fetchall())
print('Imported cleaned data and regenerated SQL outputs.')
