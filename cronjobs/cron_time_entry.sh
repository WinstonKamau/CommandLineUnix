#!/usr/bin/env bash
set -x
set -o errexit
set -o pipefail
# set -u
# set -o xtrace

create_file_for_storage() {
    touch ~/file_dump.txt
    chmod 744 ~/file_dump.txt
}

add_cron_job_to_crontab() {
  cat > cron_example <<'EOF'
0 */2 * * * date >> ~/file_dump.txt
EOF

cat cron_example | crontab

rm -rf cron_example
}

main() {
   create_file_for_storage
   add_cron_job_to_crontab 
}

main "$@"