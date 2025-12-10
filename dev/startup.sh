#!/bin/bash
# =============================================================================
# Development Session Startup Script
# =============================================================================
# This script initializes a development session by:
# 1. Pulling latest changes from GitHub
# 2. Reviewing recent code changes
# 3. Reading handover documents
# 4. Suggesting next steps
# =============================================================================

set -e  # Exit on error

echo "========================================"
echo "🚀 Starting Development Session"
echo "========================================"
echo ""

# -----------------------------------------------------------------------------
# Step 1: Pull from GitHub
# -----------------------------------------------------------------------------
echo "📥 Step 1: Syncing with remote repository..."
echo "----------------------------------------"

if git pull origin main; then
    echo "✅ Successfully pulled latest changes"
else
    echo "⚠️  Warning: Could not pull from remote. Check your connection or remote settings."
fi
echo ""

# -----------------------------------------------------------------------------
# Step 2: Review Recent Changes
# -----------------------------------------------------------------------------
echo "📋 Step 2: Recent commit history (last 10 commits)..."
echo "----------------------------------------"
git log -10 --oneline --decorate 2>/dev/null || echo "No commits yet"
echo ""

# -----------------------------------------------------------------------------
# Step 3: Read Handover Documents
# -----------------------------------------------------------------------------
echo "📄 Step 3: Checking handover documents..."
echo "----------------------------------------"

# Check for HANDOVER.md
if [ -f "HANDOVER.md" ]; then
    echo "Found HANDOVER.md:"
    echo "---"
    cat HANDOVER.md
    echo "---"
else
    echo "No HANDOVER.md found (first session or not created yet)"
fi
echo ""

# Check for active OpenSpec changes
echo "📦 Active OpenSpec changes:"
openspec list 2>/dev/null || echo "No active changes or openspec not configured"
echo ""

# -----------------------------------------------------------------------------
# Step 4: Read Project Conventions
# -----------------------------------------------------------------------------
echo "📖 Step 4: Project conventions..."
echo "----------------------------------------"
if [ -f "openspec/project.md" ]; then
    echo "Project conventions from openspec/project.md:"
    head -30 openspec/project.md
    echo "..."
else
    echo "No project.md found"
fi
echo ""

# -----------------------------------------------------------------------------
# Summary
# -----------------------------------------------------------------------------
echo "========================================"
echo "✅ Startup Complete!"
echo "========================================"
echo ""
echo "Next steps:"
echo "  1. Review any active changes listed above"
echo "  2. Check tasks.md for incomplete items"
echo "  3. Start working on your feature"
echo ""
echo "When done, run: ./dev/ending.sh"
echo ""
