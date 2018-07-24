- Config remote URL : git config remote.<remote-name>.url

- Replace local changes : git checkout --<file-name>

- Git rebase : Đường đi của nhánh - Đường thẳng
- Git merge  : Đường đi của nhánh - Phân nhánh

- 2 người làm việc trên 1 branch : Thời điểm 1 : Người A chuẩn bị push code - Người B push code mới lên
							-> Người A phải 'git pull' -> solve conflict (nếu có) -> commit -> push

- 'git push' : Push tất cả những thay đổi ở local repo lên Github
- 'git pull' : Chỉ pull những thay đổi từ branch hiện tại

- Context: branches(master, login), standing on branch login
	+ (login) pull code từ branch master ở remote origin : git pull origin master
	+ (login) merge code từ branch master ở local repo : git merge master
	+ (login) push thẳng từ branch login lên branch master ở remote : git push origin login:master
	+ git pull origin master = git fetch origin + git merge origin/master

- Unstaging files : git reset HEAD <file-name>
- Undoing a commit : git reset --soft HEAD^ (HEAD^^ - undo last 2 commit)
- Adding to a commit : git add ... git commit --amend -m "message"

- git remote add <remote-name> <address>
- git remote rm <name>


- Back lai nhung file da commit :  git reset HEAD~1