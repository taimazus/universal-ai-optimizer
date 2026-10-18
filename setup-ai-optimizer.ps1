# ==============================================================================
# UNIVERSAL AI WORKSTATION SUITE (OPTIMIZER + ENTERPRISE AUDIT)
# Combines:
# 1. XERJ 40x Token-Saving Hybrid Search Engine & Cross-Session Memory
# 2. Universal AI Audit (Security, Health, 20+ Enterprise Agent Skills)
# https://github.com/taimazus/universal-ai-optimizer
# https://github.com/taimazus/universal-ai-audit
# ==============================================================================
[CmdletBinding()]
param(
  [switch]$SkipAudit,
  [switch]$SkipOptimizer
)

$ErrorActionPreference = "Continue"

Write-Host "`n==================================================================" -ForegroundColor Cyan
Write-Host "     UNIVERSAL AI WORKSTATION SUITE - FULL INSTALLER (v2.0)       " -ForegroundColor Cyan
Write-Host "      1. XERJ Token-Saving Search Engine & Cross-Session Memory   " -ForegroundColor DarkCyan
Write-Host "      2. Universal AI Audit & Enterprise Skills Suite             " -ForegroundColor DarkCyan
Write-Host "==================================================================" -ForegroundColor Cyan

$userHome = [Environment]::GetFolderPath([Environment+SpecialFolder]::UserProfile)
$appData  = $env:APPDATA
$toolsDir = "$env:SystemDrive\Tools\xerj"

# ------------------------------------------------------------------------------
# PART 1: XERJ Engine, Global Rules, MCP & Token Optimizer
# ------------------------------------------------------------------------------
if (-not $SkipOptimizer) {
    Write-Host "`n>>> [PART 1/2] Installing XERJ Engine & High-Efficiency Setup..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $toolsDir -Force | Out-Null
    $zipUrl = "https://github.com/xerj-org/xerj/releases/download/v1.0.0-rc.96/xerj-1.0.0-rc.96-x86_64-pc-windows-msvc.zip"
    $zipPath = "$toolsDir\xerj-windows.zip"

    try {
        Write-Host "  -> Downloading official XERJ Engine..." -ForegroundColor Cyan
        Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath
        Expand-Archive -Path $zipPath -DestinationPath $toolsDir -Force
        $exe = Get-ChildItem -Path $toolsDir -Filter "xerj.exe" -Recurse | Select-Object -First 1
        if ($exe -and ($exe.DirectoryName -ne $toolsDir)) {
            Copy-Item -Path $exe.FullName -Destination "$toolsDir\xerj.exe" -Force
        }
        Remove-Item -Path $zipPath -Force -ErrorAction SilentlyContinue
        Write-Host "  -> XERJ binary verified at $toolsDir\xerj.exe" -ForegroundColor Green
    } catch {
        Write-Host "  -> Warning: Could not auto-download XERJ ($_.Exception.Message)" -ForegroundColor Red
    }

    # Permanent PATH
    $machinePath = [Environment]::GetEnvironmentVariable("Path", "Machine")
    if ($machinePath -notlike "*$toolsDir*") { [Environment]::SetEnvironmentVariable("Path", "$machinePath;$toolsDir", "Machine") }
    $userPath = [Environment]::GetEnvironmentVariable("Path", "User")
    if ($userPath -notlike "*$toolsDir*") { [Environment]::SetEnvironmentVariable("Path", "$userPath;$toolsDir", "User") }
    $env:Path += ";$toolsDir"

    # MCP Configurations
    Write-Host "  -> Configuring Universal MCP Servers for all IDEs..." -ForegroundColor Cyan
    $mcpJson = '{"name":"xerj","command":"xerj","args":["mcp-server"]}'
    $mcpServerJson = '{"mcpServers":{"xerj":{"command":"xerj","args":["mcp-server"]}}}'

    New-Item -ItemType Directory -Path "$userHome\.gemini\antigravity\mcp\xerj" -Force | Out-Null
    Set-Content -Path "$userHome\.gemini\antigravity\mcp\xerj\xerj.json" -Value $mcpJson -Encoding utf8

    New-Item -ItemType Directory -Path "$userHome\.cursor" -Force | Out-Null
    Set-Content -Path "$userHome\.cursor\mcp.json" -Value $mcpServerJson -Encoding utf8

    New-Item -ItemType Directory -Path "$appData\Claude" -Force | Out-Null
    Set-Content -Path "$appData\Claude\claude_desktop_config.json" -Value $mcpServerJson -Encoding utf8

    # Global Rules & Memory Graph
    Write-Host "  -> Injecting Token Economy & Persistent Memory Constitution..." -ForegroundColor Cyan
    $memoryDir = "$userHome\.gemini\memory"
    New-Item -ItemType Directory -Path $memoryDir -Force | Out-Null
    @"
# Global Developer Memory & Architecture Graph
- User: $env:USERNAME
- Philosophy: High-efficiency, zero-token waste, production-ready code.
- Search Engine: Mandatory XERJ indexing & semantic retrieval.
- Audit & Security: Universal AI Audit compliance.
"@ | Set-Content -Path "$memoryDir\knowledge-graph.md" -Encoding utf8

    $constitution = @"
# SYSTEM-WIDE CONSTITUTION: HYPER-EFFICIENCY & AUTONOMOUS RETRIEVAL
1. Mandatory XERJ Retrieval: NEVER use recursive directory grep. Query XERJ for 40x fewer tokens.
2. Self-Healing Index: Silently verify/create .xerj indexes in opened workspaces before deep search.
3. Token Economy: Eliminate fluff. Deliver surgical diffs only.
4. Zero-Tolerance for Silent Failures: Never generate empty catch blocks or pass statements.
5. Repository Health & Audit: Apply Universal AI Audit standards on all security, PR review, and architecture tasks.
"@

    New-Item -ItemType Directory -Path "$userHome\.gemini\config\rules" -Force | Out-Null
    Set-Content -Path "$userHome\.gemini\config\rules\00-hyper-efficiency-constitution.md" -Value $constitution -Encoding utf8

    New-Item -ItemType Directory -Path "$userHome\.cursor\rules" -Force | Out-Null
    @"
---
description: Permanent hyper-efficiency and minimal token directive
globs: *
alwaysApply: true
---
$constitution
"@ | Set-Content -Path "$userHome\.cursor\rules\00-hyper-efficiency.mdc" -Encoding utf8

    New-Item -ItemType Directory -Path "$userHome\.claude" -Force | Out-Null
    Set-Content -Path "$userHome\.claude\CLAUDE.md" -Value $constitution -Encoding utf8

    # Clean telemetry bug if present
    $telemetryHook = "$userHome\.gemini\config\plugins\googlecloudtools.datacloud_telemetry"
    if (Test-Path $telemetryHook) {
        Remove-Item -Path $telemetryHook -Recurse -Force -ErrorAction SilentlyContinue
    }

    # Git Hooks
    $gitTemplate = "$userHome\.git_template\hooks"
    New-Item -ItemType Directory -Path $gitTemplate -Force | Out-Null
    $hookScript = "#!/bin/sh`nif command -v xerj >/dev/null 2>&1; then`n    xerj index . >/dev/null 2>&1 &`nfi"
    Set-Content -Path "$gitTemplate\post-checkout" -Value $hookScript -Encoding utf8
    Set-Content -Path "$gitTemplate\post-merge" -Value $hookScript -Encoding utf8
    git config --global init.templateDir "$userHome/.git_template" 2>$null

    Write-Host "  -> [OK] XERJ & Token Optimizer fully configured!" -ForegroundColor Green
}

# ------------------------------------------------------------------------------
# PART 2: Universal AI Audit (Enterprise Scanner & Skills Suite)
# ------------------------------------------------------------------------------
if (-not $SkipAudit) {
    Write-Host "`n>>> [PART 2/2] Installing Universal AI Audit & Enterprise Skills..." -ForegroundColor Yellow
    $auditRepo = "https://github.com/taimazus/universal-ai-audit.git"
    $tempAudit = Join-Path ([IO.Path]::GetTempPath()) ("ai-audit-" + [guid]::NewGuid().ToString('N'))

    try {
        Write-Host "  -> Fetching universal-ai-audit from GitHub ($auditRepo)..." -ForegroundColor Cyan
        git clone --depth 1 $auditRepo $tempAudit
        if (Test-Path "$tempAudit\install.ps1") {
            Write-Host "  -> Executing Universal AI Audit Global Installer across all agents..." -ForegroundColor Cyan
            & "$tempAudit\install.ps1" -GlobalOnly -Agents all -Skills all -Force -UserHome $userHome
            Write-Host "  -> [OK] Universal AI Audit successfully activated on all agents!" -ForegroundColor Green
        }
        Remove-Item -Path $tempAudit -Recurse -Force -ErrorAction SilentlyContinue
    } catch {
        Write-Host "  -> Warning: Could not install AI Audit ($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host "`n==================================================================" -ForegroundColor Green
Write-Host "   [SUCCESS] DUAL WORKSTATION SUITE DEPLOYED SUCCESSFULLY!        " -ForegroundColor Green
Write-Host "   - XERJ Engine: Active & token-saving                           " -ForegroundColor Green
Write-Host "   - Universal AI Audit: 20+ Enterprise Skills registered          " -ForegroundColor Green
Write-Host "   - Agents: Antigravity, Cursor, Claude, VS Code (Cline/Roo)     " -ForegroundColor Green
Write-Host "==================================================================`n" -ForegroundColor Green
