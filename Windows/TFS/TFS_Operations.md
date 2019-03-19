# TFS Operations

## Cut New Branch
1. Create a clean TFS workspace (`NIER_MEGE`)
2. Open a new instance of Visual Studio
  * Don't open any solution
3. Open `Source Control Explorer`
4. Right click `Trunk`
5. Select `Branching and Merging`, then `Branch...`
6. Select `Browse...`A
7. Browse to `SpectrumAgile/Branches`, then click `OK`
8. Enter `Target Branch Name` as `$/SpectrumAgile/Branches/{ NewBranchName }`
9. Select `Changeset` from `Branch from Version` dropdown, then enter last Trunk changeset number
10. Enter `Description` as `Branched from $/SpectrumAgile/Trunk as of changeset #{ChangesetNumber}`
11. Click `Branch`

## Merge Branch
1. Create a clean TFS workspace (`TFS_MERGE`)
2. Open a new instance of Visual Studio
  * Don't open any solution
3. Open `Source Control Explorer`
4. Force get latest for both Trunk & the relevant Branch
5. Right click the relevant Branch in `Source Control Explorer`
  * Select `Branching and Merging`
  * Click `Merge...`
6. Select appropriate settings in the next window and click `Finish`
7. Verify pending changes in local environment
8. Check-in pending changes
  - Comment: `Merged { Branch } into Trunk as of branch changeset #{ CHANGESET } [Release { MAJOR }.{ MINOR }]`

