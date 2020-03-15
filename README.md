# seasony-mock-data

##### 2020/03/12 - The repository is created

How to commit:

After changing the code please add an entry in the README.md with the following format:

### C-[YOUR INITIALS]-YYYY-MM-DD-[The number of your commit of the day]

#### AKA: C-BB-2020-03-12-1

and add the commit text after that

#### AKA: C-BB-2020-03-12-1: SQL in the file.sql changed

then use the {C-BB-2020-03-12-1} when you commit in git as your commit message

git add file.sql

git commit -m "**C-BB-2020-03-12-1**"

git push -u origin branch-name

Your second commit in the same day will look like this:

git commit -m "**C-BB-2020-03-12-2**"

---
## Commits

##### C-BB-2020-03-12-3:
- **How to commit** added to README.md
- **units.sql** added

##### C-BB-2020-03-12-4:
- **How to commit** edited

##### C-BB-2020-03-14-1:
- milligram added to units
- materials.sql added
- area_materials.sql added
- the data model changed
  - Table batch_area_crop_stages added to keep track of the stages which the crops are going to
- Relations changed according to the new table
- all primary keys are simplified to id
- crops stages turned into a table
  - new relations created
- all sql statements are consolidated in the Seasony Final.sql
- all the other files are deleted
- tables data are exported into json filed in the json folder

##### C-BB-2020-03-14-2:
  - area_materials.json created
  - Seasony Final.sql updated
  - the https://dbdiagram.io/d/5e58dfd24495b02c3b878ba4 is outdated 
  
  
##### C-BB-2020-03-15-3:
 - Seasony Final.sql update with area_material
 
[https://dbdiagram.io/d/5e58dfd24495b02c3b878ba4]: https://dbdiagram.io/d/5e58dfd24495b02c3b878ba4

