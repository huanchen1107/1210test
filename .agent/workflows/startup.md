---
description: Start development session - sync, review, and plan
---

# Development Session Startup

Follow these steps at the beginning of each development session:

## 1. Sync with Remote Repository

// turbo
```bash
git pull origin main
```

Check for any conflicts. If conflicts exist, notify the user before proceeding.

## 2. Review Recent Changes

Check what has changed since the last session:

```bash
git log -10 --oneline --decorate
```

Review the commit history to understand recent work.

## 3. Read Handover Documents

Look for and read handover documents in priority order:

a. Check for `HANDOVER.md` in project root:
   - Read the file if it exists
   - This contains context from the previous session

b. Check for active changes:
   ```bash
   openspec list
   ```

c. For each active change, read:
   - `openspec/changes/[change-id]/proposal.md`
   - `openspec/changes/[change-id]/tasks.md`
   - `openspec/changes/[change-id]/design.md` (if exists)

d. Check `openspec/project.md` for project conventions

## 4. Suggest Next Steps

Based on the handover documents and active changes:

1. Identify incomplete tasks in `tasks.md`
2. Check if any changes are ready for validation
3. Summarize the current state
4. Propose 2-3 concrete next actions

Present to the user:
- **Current State**: Brief summary of where things stand
- **Incomplete Work**: What's in progress
- **Suggested Next Steps**: Prioritized list of actions

Example format:
```
## Session Summary

**Current State:**
- Change `01-add-user-auth` is 70% complete
- Last session completed database schema

**Incomplete Work:**
- [ ] Implement API endpoints (tasks.md item 1.2)
- [ ] Add frontend components (tasks.md item 1.3)
- [ ] Write tests (tasks.md item 1.4)

**Suggested Next Steps:**
1. Continue with API endpoint implementation
2. Run validation checks on completed work
3. Update tasks.md progress markers
```
