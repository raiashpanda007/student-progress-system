-- CreateEnum
CREATE TYPE "ContestStatus" AS ENUM ('PENDING', 'RUNNING', 'FINISHED');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phoneNumber" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EmailReminders" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "updatesCount" INTEGER NOT NULL DEFAULT 0,
    "automaticUpdate" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "EmailReminders_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Codeforces" (
    "id" TEXT NOT NULL,
    "handle" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "lastActivity" TIMESTAMP(3) NOT NULL,
    "currentRating" INTEGER NOT NULL,
    "maxRating" INTEGER NOT NULL,
    "lastSyncedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Codeforces_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Problems" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "contestId" TEXT,
    "index" TEXT,
    "tags" TEXT[],
    "rating" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Problems_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Submissions" (
    "id" TEXT NOT NULL,
    "problemId" TEXT NOT NULL,
    "codeforcesId" TEXT NOT NULL,
    "submissionTime" TIMESTAMP(3) NOT NULL,
    "language" TEXT NOT NULL,
    "verdict" TEXT NOT NULL,

    CONSTRAINT "Submissions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Contests" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "startTime" TIMESTAMP(3) NOT NULL,
    "endTime" TIMESTAMP(3) NOT NULL,
    "ratingBeforeContest" INTEGER NOT NULL,
    "ratingAfterContest" INTEGER NOT NULL,
    "rank" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "status" "ContestStatus" NOT NULL,

    CONSTRAINT "Contests_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SolvedInContest" (
    "id" TEXT NOT NULL,
    "codeforcesId" TEXT NOT NULL,
    "problemId" TEXT NOT NULL,
    "contestId" TEXT NOT NULL,
    "solvedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SolvedInContest_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_HandlesSolvedProblems" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_HandlesSolvedProblems_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_HandlesContestsGiven" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_HandlesContestsGiven_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_ProblemsInContests" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_ProblemsInContests_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Codeforces_handle_key" ON "Codeforces"("handle");

-- CreateIndex
CREATE UNIQUE INDEX "Codeforces_userId_key" ON "Codeforces"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "SolvedInContest_codeforcesId_problemId_contestId_key" ON "SolvedInContest"("codeforcesId", "problemId", "contestId");

-- CreateIndex
CREATE INDEX "_HandlesSolvedProblems_B_index" ON "_HandlesSolvedProblems"("B");

-- CreateIndex
CREATE INDEX "_HandlesContestsGiven_B_index" ON "_HandlesContestsGiven"("B");

-- CreateIndex
CREATE INDEX "_ProblemsInContests_B_index" ON "_ProblemsInContests"("B");

-- AddForeignKey
ALTER TABLE "EmailReminders" ADD CONSTRAINT "EmailReminders_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Codeforces" ADD CONSTRAINT "Codeforces_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Submissions" ADD CONSTRAINT "Submissions_problemId_fkey" FOREIGN KEY ("problemId") REFERENCES "Problems"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Submissions" ADD CONSTRAINT "Submissions_codeforcesId_fkey" FOREIGN KEY ("codeforcesId") REFERENCES "Codeforces"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SolvedInContest" ADD CONSTRAINT "SolvedInContest_codeforcesId_fkey" FOREIGN KEY ("codeforcesId") REFERENCES "Codeforces"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SolvedInContest" ADD CONSTRAINT "SolvedInContest_problemId_fkey" FOREIGN KEY ("problemId") REFERENCES "Problems"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SolvedInContest" ADD CONSTRAINT "SolvedInContest_contestId_fkey" FOREIGN KEY ("contestId") REFERENCES "Contests"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_HandlesSolvedProblems" ADD CONSTRAINT "_HandlesSolvedProblems_A_fkey" FOREIGN KEY ("A") REFERENCES "Codeforces"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_HandlesSolvedProblems" ADD CONSTRAINT "_HandlesSolvedProblems_B_fkey" FOREIGN KEY ("B") REFERENCES "Problems"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_HandlesContestsGiven" ADD CONSTRAINT "_HandlesContestsGiven_A_fkey" FOREIGN KEY ("A") REFERENCES "Codeforces"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_HandlesContestsGiven" ADD CONSTRAINT "_HandlesContestsGiven_B_fkey" FOREIGN KEY ("B") REFERENCES "Contests"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProblemsInContests" ADD CONSTRAINT "_ProblemsInContests_A_fkey" FOREIGN KEY ("A") REFERENCES "Contests"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProblemsInContests" ADD CONSTRAINT "_ProblemsInContests_B_fkey" FOREIGN KEY ("B") REFERENCES "Problems"("id") ON DELETE CASCADE ON UPDATE CASCADE;
