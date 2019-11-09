# [Team Foundation Server](https://en.wikipedia.org/wiki/Team_Foundation_Server)

## Contents
- [Overview](#overview)
- [Operations](#operations)
  - [Cut Branch](#cut-branch)
  - [Merge Branch](#merge-branch)

## Overview
I use TFS in conjunction with Visual Studio as a centralized version control system for a large corporate [ASP.NET](https://docs.microsoft.com/en-us/aspnet/#pivot=aspnet) application I work on. Below are some commands and operations I find useful.

## Operations

### Cut Branch

#### Description
Cut a new branch from Trunk.

#### Steps
1. Create a clean TFS workspace
2. Open a new instance of Visual Studio
    - Don't open any solution
3. Open `Source Control Explorer`
4. Right click `Trunk`
5. Select `Branching and Merging`, then `Branch...`
6. Select `Browse...`
7. Browse to `path/to/target/dir`, then click `OK`
8. Enter `Target Branch Name` as `path/to/target/dir/{ NewBranchName }`
9. Select `Changeset` from `Branch from Version` drop-down, then enter last Trunk changeset number
10. Enter `Description` as `Branched from Trunk as of changeset #{ ChangesetNumber }`
11. Click `Branch`

### Merge Branch

#### Description
Merge a branch into Trunk.

#### Steps
1. Create a clean TFS workspace
2. Open a new instance of Visual Studio
    - Don't open any solution
3. Open `Source Control Explorer`
4. Force get latest for both Trunk & the relevant Branch
5. Right click the relevant Branch in `Source Control Explorer`
    - Select `Branching and Merging`
    - Click `Merge...`
6. Select appropriate settings in the next window and click `Finish`
7. Verify pending changes in local environment
8. Check-in pending changes
    - Comment: `Merged { Branch } into Trunk as of branch changeset #{ CHANGESET } [Release { MAJOR }.{ MINOR }]`

