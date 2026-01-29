# Commit and Push Work

Please perform the following tasks:

1. **Check current git status** - Review all modified files and understand what changes have been made

2. **Determine project type** - Check if this is a Leanpay project or personal/side project

3. **Create meaningful commit**
   - Stage appropriate files
   - For Leanpay projects: Use format `TEC-xxx commit message`
   - For personal projects: Use clear, descriptive message without ticket prefix

4. **Verify before commit**
   - Ensure NO .env files are staged (.env, .env.local, .env.development, .env.production, .env.test, .env.staging)
   - Ensure NO secrets, API keys, or credentials are included
   - Ensure NO console.log statements in production code

5. **Push to remote** - Push your commits to the appropriate branch
   - Leanpay: feature/TEC-xxx, bugfix/TEC-xxx, or hotfix/TEC-xxx
   - Personal: feature/description, bugfix/description, or hotfix/description

6. **Group files into logical commits**
   - If multiple files are changed, group them by feature/purpose
   - Create separate commits for unrelated changes
   - Example: one commit for UI changes, another for API changes

Remember to:
- NEVER commit .env files
- NEVER commit secrets or API keys
- Group related changes into logical commits
- Ensure tests pass before pushing (if tests exist)
- NEVER add "Co-Authored-By" or any AI attribution text to commit messages
