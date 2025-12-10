---
description: End development session - wrap up, validate, and handover
---

# Development Session Ending

Follow these steps at the end of each development session:

## 1. Update Task Status

Review all active changes and update their task lists:

```bash
openspec list
```

For each active change:

a. Review `openspec/changes/[change-id]/tasks.md`

b. Update completion status:
   - Mark completed items: `- [x]`
   - Mark in-progress items: `- [/]`
   - Leave pending items: `- [ ]`

c. Add any new tasks discovered during the session

## 2. Validate Changes

Run validation on all active changes:

// turbo
```bash
openspec validate --strict
```

If validation passes for a specific change:
```bash
openspec validate [change-id] --strict
```

Document any validation errors that need to be addressed in the next session.

## 3. Check if Change is Ready for Archive

For each active change, check if ALL tasks are complete:

If all tasks marked `[x]`:
- Ask user if the change has been deployed to production
- If YES and user confirms:
  // turbo
  ```bash
  openspec archive [change-id] --yes
  ```
- If NO, note in handover that change is complete but awaiting deployment

## 4. Write Handover Document

Create or update `HANDOVER.md` in the project root with:

a. **Session Summary**: What was accomplished today

b. **Completed Work**: List of finished tasks/changes

c. **In-Progress Work**: Current state of active changes
   - Change IDs
   - Percentage complete
   - Current task being worked on

d. **Blockers**: Any issues or decisions needed

e. **Next Session Plan**: What should be tackled next

f. **Context Notes**: Any important decisions or discoveries

Example `HANDOVER.md` format:
```markdown
# Handover Document
*Last Updated: [DATE]*

## Session Summary
[Brief description of what was done in this session]

## Completed Work
- [x] Implemented user authentication API
- [x] Added database migrations

## In-Progress Work

### Change: 01-add-user-auth (80% complete)
**Current Status**: API endpoints complete, working on frontend

**Remaining Tasks**:
- [ ] Add login form component
- [ ] Write integration tests

**Location**: Currently in `src/components/auth/LoginForm.tsx`

## Blockers
- Need clarification on password reset flow
- Waiting for design mockups for 2FA screen

## Next Session Plan
1. Complete login form component
2. Write tests for authentication flow
3. Validate and prepare for deployment

## Context Notes
- Decided to use JWT with 24-hour expiration
- Password hashing uses bcrypt with salt rounds of 12
- User table schema updated in migration `20231210_add_auth.sql`
```

## 5. Commit and Push Changes

Stage all changes:
```bash
git add .
```

Create a descriptive commit message:
```bash
git commit -m "session: [brief summary of work done]"
```

Push to remote:
// turbo
```bash
git push origin main
```

If there are uncommitted changes but the session is incomplete, consider:
- Creating a WIP (Work In Progress) commit
- Or noting in HANDOVER.md that there are uncommitted changes

## 6. Session Summary

Present to the user a final summary:

```
## Session Complete

**Work Completed:**
- [List major accomplishments]

**Changes Updated:**
- [Change IDs and their new status]

**Handover Created:**
- Location: HANDOVER.md
- Next session can start with /startup workflow

**Repository Status:**
- ✅ Changes committed
- ✅ Pushed to remote
- ✅ Ready for next session
```
