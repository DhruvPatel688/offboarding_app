# README
# 🧾 Offboarding Checklist Automation Tool

A modern, full-stack web application built to help HR and IT teams streamline employee offboarding by automating task management, tracking access revocation, and maintaining compliance with audit-ready logs.

<img width="1435" height="812" alt="Screenshot 2025-07-12 at 2 37 34 PM" src="https://github.com/user-attachments/assets/6ba7aee3-ca9c-48a2-b5b8-9adc6c736928" />


---

## 🧠 Problem It Solves

Manual offboarding processes often lead to:
- Missed revocation of system access
- Unreturned assets (laptops, badges, etc.)
- Poor documentation for compliance audits
- Delays in task handoffs across departments

This tool replaces spreadsheet checklists and siloed communications with a centralized system.

---

## 🚀 Features

### ✅ Core Functionality
- **Create & Manage Offboarding Checklists** tied to employees
- **Department-based task assignment** (IT, HR, Finance, etc.)
- **Track completion status** with real-time progress bars
- **Edit employee status and due dates** inline
- **Audit trail** of task updates with timestamp and user

### 🔐 Authentication & Security
- User authentication with **Devise**
- Role-based task creation/editing
- Designed with extensibility for SSO, MFA, and encryption

### 📊 UX
- Clean, responsive UI using **Bootstrap 5**
- Status color-coding and badge indicators
- Progress bars for task completion
- Mobile-friendly layout (WIP)

---

## 🛠️ Tech Stack

| Layer | Tech |
|-------|------|
| Frontend | Bootstrap 5, ERB Templates |
| Backend | Ruby on Rails 8 |
| Database | PostgreSQL |
| Authentication | Devise |
| Deployment | Fly.io / Render |
| Future Integrations | HRIS APIs, Slack Email Alerts, SSO, MFA |

---

## 📸 Screenshots


<img width="1440" height="810" alt="Screenshot 2025-07-12 at 2 38 53 PM" src="https://github.com/user-attachments/assets/0f82ab7d-61ff-42e3-b73d-a293c5f8e7a8" />

- Dashboard with all offboarding checklists  
- Individual employee checklist with status, due date, and audit log  
- Edit forms for tasks, due dates, and status updates

---

## 🔗 Live Demo

👉 [Click here to view the deployed app](https://offboarding-tracker.onrender.com/)
_(Best viewed on desktop — optimized for internal use cases.)_

---

## 👨‍💻 Developer

**Dhruv Patel**  
- Incoming MS in Computer Science @ University of Memphis  
- Previous experience as a TA and InfoSec Analyst  
- Focused on building real-world tools that solve operational problems  
- [LinkedIn](https://www.linkedin.com/in/dhruvtn/) | [GitHub](https://github.com/DhruvPatel688)

---

## 📬 Want to Collaborate?

Feel free to open issues, submit PRs, or reach out if you’re interested in expanding the app with:
- HRIS integrations
- More advanced automation
- Security compliance features

