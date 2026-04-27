param(
  [Parameter(Mandatory=$true)]
  [string]$RemoteUrl
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path -LiteralPath ".git")) {
  git init
}

git branch -M main
git add index.html robots.txt sitemap.xml README-google.md .nojekyll mazlum-allohga-soldim.mp3 publish-to-github.ps1

if (-not (git config user.email)) {
  git config user.email "you@example.com"
}

if (-not (git config user.name)) {
  git config user.name "Mazlum"
}

git commit -m "Add Mazlum Allohga soldim page" 2>$null

$existingRemote = git remote get-url origin 2>$null
if ($LASTEXITCODE -eq 0) {
  git remote set-url origin $RemoteUrl
} else {
  git remote add origin $RemoteUrl
}

git push -u origin main

Write-Host ""
Write-Host "Pushed to GitHub."
Write-Host "Now enable GitHub Pages: repository Settings > Pages > Deploy from a branch > main > /root."
