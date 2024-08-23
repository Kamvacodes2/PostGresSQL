--  using transaction blocks to save or revert changes

-- Finality of Changes: Changes made by DELETE, UPDATE, or other queries are permanent 
-- unless restored from a backup.

--Transaction Blocks: Allow you to review changes before finalizing or reverting them.
--START TRANSACTION: Begins the transaction block.

--COMMIT: Saves all changes made within the transaction block.

--ROLLBACK: Reverts all changes made within the transaction block.

--Use Case: 
-- Transaction blocks are useful for ensuring that a sequence of 
-- operations either all succeed or all fail together (e.g., purchasing tickets).

--Example Application: 
--In cleaning data in the meat_poultry_egg_inspect table, 
-- transaction blocks can help decide whether to keep or 
--discard changes related to correcting a company's name.