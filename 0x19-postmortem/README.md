# **Postmortem: Unexpected Downtime in Study Abroad Platform**

## **Issue Summary**
- **Outage Duration:** February 26, 2025, from 02:15 AM to 04:45 AM UTC
- **Impact:**
  - The Study Abroad Platform was unavailable for 2 hours and 30 minutes.
  - Users were unable to access program details, submit applications, or communicate with advisors.
  - Approximately 40% of active users experienced disruptions, leading to missed application deadlines.
- **Root Cause:**
  - A misconfigured API gateway caused authentication failures, preventing access to user profiles and application submission services.

## **Timeline**
- **02:15 AM UTC:** Monitoring system triggered an alert for increased authentication failures.
- **02:20 AM UTC:** On-call engineer received an alert and began investigating API gateway logs.
- **02:35 AM UTC:** Multiple users reported login issues and failed form submissions.
- **02:45 AM UTC:** Initial hypothesis suspected an issue with the authentication provider.
- **03:00 AM UTC:** Redirected focus to internal authentication mechanisms, discovering repeated token expiration errors.
- **03:15 AM UTC:** Attempted a temporary fix by refreshing authentication tokens manually, which provided limited relief.
- **03:30 AM UTC:** Issue escalated to the backend engineering team for deeper analysis.
- **04:00 AM UTC:** Root cause identified – API gateway misconfiguration leading to incorrect token validation logic.
- **04:15 AM UTC:** Configuration corrected, and API tokens reissued.
- **04:30 AM UTC:** System stability restored.
- **04:45 AM UTC:** Full services resumed, and affected users were notified.

## **Root Cause and Resolution**
- **Root Cause:**
  - A recent update to the API gateway introduced stricter token validation policies without updating dependent services.
  - This led to invalid authentication tokens, blocking user access to critical platform functionalities.
  - Lack of fallback mechanisms for token refresh compounded the issue.

- **Resolution:**
  - Updated API gateway configuration to correctly validate authentication tokens.
  - Implemented an automatic token refresh mechanism to prevent future authentication failures.
  - Improved error logging for early detection of token-related issues.

## **Corrective and Preventative Measures**
- **Immediate Fixes:**
  - Adjust API gateway token validation logic and implement automatic refresh.
  - Enable real-time authentication monitoring with automated alerts.
  - Improve error messaging for users experiencing login issues.

- **Long-Term Improvements:**
  - Implement a fallback authentication method to prevent total service outages.
  - Introduce redundancy measures for API authentication services.
  - Conduct regular integration testing to ensure authentication mechanisms work seamlessly.
  - Enhance documentation and team training on API authentication updates.
