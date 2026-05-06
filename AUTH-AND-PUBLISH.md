# Auth And Publish

This repo is ready to publish as the special GitHub profile repository:

```text
LukeLavender20/LukeLavender20
```

The current machine does not have an authenticated GitHub write path. After GitHub authentication is available, run this from the repo root:

```powershell
git credential-manager github login --device --username LukeLavender20
powershell -ExecutionPolicy Bypass -File scripts/publish-github-profile.ps1
```

The publish script will:

- Create the public GitHub repo if it does not exist.
- Set `origin` to `https://github.com/LukeLavender20/LukeLavender20.git`.
- Push `main`.

If the repository is created manually in the GitHub website first, the same publish script still works.

