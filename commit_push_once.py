import os
import subprocess

def git_add_commit_push(repo_dir, relative_file_path, commit_message):
    try:
        # Change to the repository directory
        os.chdir(repo_dir)

        # Stage the file
        subprocess.run(['git', 'add', relative_file_path], check=True)

        # Commit the file
        subprocess.run(['git', 'commit', '-m', commit_message], check=True)

        # Push the commit
        subprocess.run(['git', 'push'], check=True)

        print(f"Successfully committed and pushed {relative_file_path}")

    except subprocess.CalledProcessError as e:
        print(f"Failed to commit and push {relative_file_path}. Error: {e}")

def traverse_and_commit(repo_dir):
    for root, dirs, files in os.walk(repo_dir):
        for file in files:
            # Get the file path relative to the repository root
            relative_file_path = os.path.relpath(os.path.join(root, file), repo_dir)
            commit_message = f"Add {relative_file_path}"  # Customize your commit message here
            git_add_commit_push(repo_dir, relative_file_path, commit_message)

if __name__ == "__main__":
    directory_to_commit = "D:/Assignment/CLASSROOM/Sem-6"  # Replace with your directory path
    traverse_and_commit(directory_to_commit)
