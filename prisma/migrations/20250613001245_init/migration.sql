/*
  Warnings:

  - You are about to drop the column `accountType` on the `bank_accounts` table. All the data in the column will be lost.
  - You are about to drop the column `categoryId` on the `bank_accounts` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `bank_accounts` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `categories` table. All the data in the column will be lost.
  - You are about to drop the column `bankAccountId` on the `transactions` table. All the data in the column will be lost.
  - You are about to drop the column `categoryId` on the `transactions` table. All the data in the column will be lost.
  - You are about to drop the column `transaction_value` on the `transactions` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `transactions` table. All the data in the column will be lost.
  - Added the required column `name` to the `bank_accounts` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `bank_accounts` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `categories` table without a default value. This is not possible if the table is not empty.
  - Added the required column `bank_account_id` to the `transactions` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `transactions` table without a default value. This is not possible if the table is not empty.
  - Added the required column `value` to the `transactions` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "bank_accounts" DROP CONSTRAINT "bank_accounts_categoryId_fkey";

-- DropForeignKey
ALTER TABLE "bank_accounts" DROP CONSTRAINT "bank_accounts_userId_fkey";

-- DropForeignKey
ALTER TABLE "categories" DROP CONSTRAINT "categories_userId_fkey";

-- DropForeignKey
ALTER TABLE "transactions" DROP CONSTRAINT "transactions_bankAccountId_fkey";

-- DropForeignKey
ALTER TABLE "transactions" DROP CONSTRAINT "transactions_categoryId_fkey";

-- DropForeignKey
ALTER TABLE "transactions" DROP CONSTRAINT "transactions_userId_fkey";

-- AlterTable
ALTER TABLE "bank_accounts" DROP COLUMN "accountType",
DROP COLUMN "categoryId",
DROP COLUMN "userId",
ADD COLUMN     "name" TEXT NOT NULL,
ADD COLUMN     "user_id" UUID NOT NULL;

-- AlterTable
ALTER TABLE "categories" DROP COLUMN "userId",
ADD COLUMN     "user_id" UUID NOT NULL;

-- AlterTable
ALTER TABLE "transactions" DROP COLUMN "bankAccountId",
DROP COLUMN "categoryId",
DROP COLUMN "transaction_value",
DROP COLUMN "userId",
ADD COLUMN     "bank_account_id" UUID NOT NULL,
ADD COLUMN     "category_id" UUID,
ADD COLUMN     "user_id" UUID NOT NULL,
ADD COLUMN     "value" DOUBLE PRECISION NOT NULL,
ALTER COLUMN "date" DROP DEFAULT;

-- AddForeignKey
ALTER TABLE "bank_accounts" ADD CONSTRAINT "bank_accounts_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "categories" ADD CONSTRAINT "categories_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transactions" ADD CONSTRAINT "transactions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transactions" ADD CONSTRAINT "transactions_bank_account_id_fkey" FOREIGN KEY ("bank_account_id") REFERENCES "bank_accounts"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transactions" ADD CONSTRAINT "transactions_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "categories"("id") ON DELETE SET NULL ON UPDATE CASCADE;
