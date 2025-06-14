
---

````markdown
# 🧑‍🎓 Student Progress Management System

A full-stack MERN-based platform to track and visualize student progress on [Codeforces](https://codeforces.com), including contest performance, problem-solving stats, and automated activity-based notifications.

## 🧱 Tech Stack

- **Monorepo Tooling**: [TurboRepo](https://turbo.build/)
- **Frontend**: Next.js (in `apps/web`)
- **Backend**: Express.js + TypeScript (in `apps/backend`)
- **Database**: PostgreSQL with Prisma ORM (in `packages/database`)
- **Shared Utilities & Configs**: Located in `packages/`

## 📁 Monorepo Structure

```bash
.
├── apps
│   ├── backend       # Express backend
│   └── web           # Next.js frontend
├── packages
│   ├── database      # Prisma schema & database logic
│   ├── eslint-config # Shared ESLint config
│   ├── typescript-config # Shared tsconfig
│   ├── ui            # Shared UI components (optional)
│   └── utils         # Shared utility functions
├── docker-compose.yml
├── Dockerfile
├── turbo.json
└── README.md
````

## 🚀 Features

* ✅ Student table view with add/edit/delete options and CSV export.
* ✅ Detailed profile view: contest history, rating graph, problem stats.
* ✅ Filtering: 7/30/90/365-day performance filters.
* ✅ Rating progression, hardest solved problems, average stats, and heatmaps.
* ✅ Cron-based daily sync from Codeforces API.
* ✅ Inactivity detection with automatic email reminders.
* ✅ Manual CF handle refresh support.
* ✅ Light/Dark mode toggle.
* ✅ Responsive for mobile and tablets.
* ✅ Well-structured and documented codebase.

---

## 🛠️ Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/student-progress-system.git
cd student-progress-system
```

### 2. Install Dependencies

```bash
pnpm install
```

### 3. Build Backend

```bash
cd apps/backend
pnpm run tsbuild
cd ../..
```

### 4. Start with Docker

Ensure Docker is running on your system:

```bash
docker-compose up --build
```

---

## 🌐 Environment Variables

Create the following `.env` files:

### apps/backend/.env

```env
DATABASE_URL=postgresql://user:password@postgres:5432/student_db
PORT=4000
```

### packages/database/.env

```env
DATABASE_URL=postgresql://user:password@localhost:5432/student_db
```

Modify credentials based on your local or containerized DB setup.

---

## 🧪 Development Scripts

### Prisma

```bash
# Generate Prisma client
pnpm --filter database prisma generate

# Apply migrations
pnpm --filter database prisma migrate dev
```

---

## 📹 Submission Checklist

* [x] Functionality video recording
* [x] GitHub repo link
* [x] Complete README (this file)
* [x] Mobile & Tablet responsive
* [x] Light/Dark mode support

---

## 📖 Author

Made with ❤️ by **Ashwin Rai**
🔗 [GitHub](https://github.com/raiashpanda007)

---

```

Let me know if you want a section for API documentation or contribution guidelines too — I can add that next.
```
