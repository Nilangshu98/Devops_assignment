# Assignment 2 - Dockerize Flask App

## Application

A simple Flask application with two endpoints.

- `/` - Homepage
- `/health` - Health check

## Requirements

- Docker

## Build the Docker image

```bash
docker build -t devops-flask-app .

Run the container
docker run -d --name devops-flask-container -p 5000:5000 devops-flask-app


Test the homepage
curl http://localhost:5000/


Expected output:
Hello from DevOps!


Test health check
curl http://localhost:5000/health


Expected output:
{"status":"ok"}


GitHub Actions
The GitHub Actions workflow automatically builds the Docker
image when code is pushed to main or a pull request targets main.

Workflow file:

.github/workflows/build.yml
Stop the container
docker stop devops-flask-container


Remove the container
docker rm devops-flask-container


Save and exit Nano.

---

# Step 12 – Find and fix the bugs

Your assignment asks you to find and fix the bugs in the teammate's code.

These are the important things to check:

| Problem | Correct solution |
|---|---|
| App only listens on localhost inside the container | Use `host="0.0.0.0"` |
| Incorrect Flask app initialization | `app = Flask(__name__)` |
| Incorrect Python main guard | `if __name__ == "__main__":` |
| Flask dependency missing | Add `flask` in `requirements.txt` |
| Container port not exposed/mapped | Use `EXPOSE 5000` and `-p 5000:5000` |
| Docker startup command missing | Add `CMD ["python3", "app.py"]` |

<text color="warning" weight="medium">The code shown in your assignment PDF already appears to have the correct Flask structure, so these are potential issues to report if present in the teammate's broken version, rather than claiming all of them were definitely found.</text>

---

# Step 13 – Create GitHub repository

Do this in your browser:

1. Open [https://github.com](https://github.com).
2. Sign in.
3. Click the `+` icon at the top-right.
4. Click **New repository**.
5. Enter repository name:

   `docker-flask-ci`

6. Select **Public**.
7. Leave README, `.gitignore` and License unchecked.
8. Click **Create repository**.

---

# Step 14 – Push Assignment 2 to GitHub

Go back to Ubuntu WSL.

Make sure you're in the project folder:

```bash
cd ~/assignment2

