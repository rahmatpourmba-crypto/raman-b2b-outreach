# Script to publish Raman B2B System to GitHub Pages
param (
    [string]$RepoName = "raman-b2b-outreach",
    [string]$GitHubUser = "rahmatpourmba-crypto"
)

Write-Host "=== Deploying Raman B2B Outreach System to GitHub Pages ===" -ForegroundColor Cyan
Set-Location "C:\Users\Admin\.gemini\antigravity\scratch\Raman_Outreach_System"

Write-Host "1. Checking git status..." -ForegroundColor Yellow
git status

Write-Host "`n2. To push to GitHub, make sure you have created the repository on https://github.com/new" -ForegroundColor Yellow
Write-Host "Repo URL: https://github.com/$GitHubUser/$RepoName.git" -ForegroundColor Green

$remoteExists = git remote get-url origin 2>$null
if (-not $remoteExists) {
    git remote add origin "https://github.com/$GitHubUser/$RepoName.git"
    Write-Host "Added remote origin." -ForegroundColor Green
}

Write-Host "`nPushing main branch to GitHub..." -ForegroundColor Cyan
git push -u origin main

Write-Host "`nOnce pushed, GitHub Actions will automatically deploy to:" -ForegroundColor Green
Write-Host "https://$GitHubUser.github.io/$RepoName/" -ForegroundColor Cyan
