# 1-user_limit.pp
# This Puppet manifest adjusts system file descriptor limits for the 'holberton' user
# to avoid "Too many open files" errors

exec { 'change-os-configuration-for-holberton-user':
  command => '
    # Add higher limits for holberton in /etc/security/limits.conf
    echo "holberton soft nofile 65535" >> /etc/security/limits.conf
    echo "holberton hard nofile 65535" >> /etc/security/limits.conf

    # Ensure pam_limits.so is enabled in PAM session files
    if ! grep -q "session required pam_limits.so" /etc/pam.d/common-session; then
      echo "session required pam_limits.so" >> /etc/pam.d/common-session
    fi

    if ! grep -q "session required pam_limits.so" /etc/pam.d/common-session-noninteractive; then
      echo "session required pam_limits.so" >> /etc/pam.d/common-session-noninteractive
    fi
  ',
}
