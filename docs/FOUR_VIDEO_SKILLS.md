# Four video Skill installation for Codex

This branch adds an installer for **Remotion, HyperFrames, Video-shotcraft, and anything2explainer**. It does **not** silently change the MotionGit template files on main.

Run in your actual Codex cloud development terminal (with Node.js 18+, npm, and git):

```bash
bash scripts/install-four-video-skills.sh
```

Install methods follow the official projects:
- Remotion: `npx -y skills@latest add remotion-dev/skills -g -y`
- HyperFrames: `npx -y hyperframes skills update` (core skills)
- Video-shotcraft: `npx -y skills@latest add Vincentwei1021/video-shotcraft -g -y`
- anything2explainer: clone source and link to `~/.codex/skills/anything2explainer`

**Important:** The script must actually be executed in the Codex environment. Committing it to GitHub alone does not install any Skill. Dependencies for full video rendering, such as FFmpeg, Chrome/Chromium, Python packages, sound assets, and TTS, vary by system. anything2explainer was documented/tested primarily on macOS and Linux; Windows support is unverified.

For this user's workflow, keep 16:9 output, use voice-aligned semantic shots (not fixed cut intervals), and keep subtitles disabled except for intentionally designed dynamic emphasis text.

Sources: https://www.remotion.dev/docs ; https://github.com/heygen-com/hyperframes ; https://github.com/Vincentwei1021/video-shotcraft ; https://github.com/Vincentwei1021/anything2explainer
