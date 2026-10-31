#!/usr/bin/env bash
set -euo pipefail

# Run in the actual Codex Linux/macOS development environment, not on GitHub's web UI.
# Install Codex skills to the user-level Codex skills directory.
command -v node >/dev/null || { echo "Node.js 18+ required"; exit 1; }
command -v npm >/dev/null || { echo "npm required"; exit 1; }
command -v git >/dev/null || { echo "git required"; exit 1; }
node -e 'if (+process.versions.node.split(".")[0] < 18) process.exit(1)' || { echo "Node.js 18+ required"; exit 1; }

echo "[1/4] Remotion skill"
npx -y skills@latest add remotion-dev/skills -g -y

echo "[2/4] HyperFrames core skills"
npx -y hyperframes skills update

echo "[3/4] Video-shotcraft skill"
npx -y skills@latest add Vincentwei1021/video-shotcraft -g -y

echo "[4/4] anything2explainer skill"
mkdir -p "${HOME}/.codex/skills" "${HOME}/.local/share/video-skills"
dest="${HOME}/.local/share/video-skills/anything2explainer"
if [ -d "${dest}/.git" ]; then
  git -C "${dest}" pull --ff-only
else
  git clone --depth=1 https://github.com/Vincentwei1021/anything2explainer.git "${dest}"
fi
link="${HOME}/.codex/skills/anything2explainer"
if [ -L "${link}" ]; then
  ln -sfn "${dest}" "${link}"
elif [ -e "${link}" ]; then
  echo "Existing non-symlink path: ${link}; leaving intact. Resolve manually."
else
  ln -s "${dest}" "${link}"
fi

echo "Checking additional runtime dependencies (not installing system packages automatically)..."
for bin in ffmpeg python3 zsh; do
  if command -v "${bin}" >/dev/null; then echo "[OK] ${bin}"; else echo "[MISSING] ${bin}"; fi
done
echo "anything2explainer additionally needs Python packages edge-tts==7.2.8, numpy, pillow, scipy."
echo "Review its README/SKILL.md before installing Python packages or running the video pipeline."
echo "Restart your Codex session to discover newly installed skills."
