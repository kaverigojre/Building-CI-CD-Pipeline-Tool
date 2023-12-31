import requests
import json


def get_latest_commit(repo_owner, repo_name, access_token):
    # Construct the GitHub API endpoint for commits
    api_url = f'https://api.github.com/repos/{repo_owner}/{repo_name}/commits'

    # Set up the headers with the provided access token
    headers = {
        'Authorization': f'token {access_token}',
        'Accept': 'application/vnd.github.v3+json'
    }

    # Make the GET request to the GitHub API
    response = requests.get(api_url, headers=headers)

    # Check if the request was successful (status code 200)
    if response.status_code == 200:
        # Parse the response JSON
        
        commits = response.json()
        more_data = json.dumps(commits)
        
        #committer_name = commits.get("commit", {}).get("committer", {}).get("name")

        #committer_name = latest_commit.get("commit", {}).get("committer", {}).get("name")


        # Check if there are any commits
        if commits:
            # Return the latest commit SHA
            return commits[0]['sha'], more_data
        else:
            print("No commits found in the repository.")
            return None
    else:
        # Print an error message if the request was not successful
        print(f"Error: Unable to fetch commits. Status code: {response.status_code}")
        return None

def main():
    # GitHub repository information
    repo_owner = 'kaverigojre'
    repo_name = 'Building-CI-CD-Pipeline-Tool'
    
    # GitHub personal access token
    # Note: Make sure to keep your access token secure and do not share it publicly
    access_token = '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'

    # Get the latest commit SHA
    latest_commit_sha = get_latest_commit(repo_owner, repo_name, access_token)

    if latest_commit_sha:
        print(f"Latest commit SHA: {latest_commit_sha}")
    else:
        print("Failed to retrieve the latest commit SHA.")

if __name__ == "__main__":
    main()
