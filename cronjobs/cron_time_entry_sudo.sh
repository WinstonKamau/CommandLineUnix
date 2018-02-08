#!/usr/bin/env bash
set -x
set -o errexit
set -o pipefail
# set -u
# set -o xtrace

add_cronjob_to_sudo_crontab() {
  cat > cron_example <<'EOF'
0 */2 * * * date >> file_dump2.txt
EOF

cat cron_example | sudo crontab

sudo rm -rf cron_example
}

main() {
  add_cronjob_to_sudo_crontab
}

main "$@"