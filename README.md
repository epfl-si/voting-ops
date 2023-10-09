# EPFL eVoting ops



echo "--member $(docker exec dela-worker-evdemo1 /bin/bash -c 'LLVL=error dvoting --config /data/node ordering export')"


## Purpose

The goal of this repository is to deploy a minimal eVoting service based on 
the [dvoting][dvoting-repo] system with Ansible. This includes N (N>=4) conodes and a web frontend.

## Usage

```bash
# ./votsible
```

### Examples

### Only on one host

```bash
./votsible  --prod
./votsible  --qual
./votsible  --test
./votsible  --demo
#./votsible  --dev
```

### Specifying a tag

```bash
./votsible --test -t "test"
```

### Specifying multiple tags

```bash
./votsible --test -t "tag1,tag2,tag3"
```

### Skip specifying a tag

```bash
./votsible --test --skip-tags "github_key_import"
```

### Skip specifying multiple tags

```bash
./votsible --test -skip-tags "tag1,tag2,tag3"
```


## Notes

### Git tags
| TAG | Short | Description |
| --- | ----- | ----------- |
| add | When the project welcome new files
| btf | Changes that do not affect the meaning of the code (beautifulage)
| cnf | Changes in app configuration files
| doc | Documentation only changes
| fix | A bug fix
| fea | A new feature
| hoc | Repository cleanup (HouseCleaning)
| ign | When adding a .gitignore file or similar
| oth | Other changes that don't modify src or test files
| rfa | A code change (refactor) that neither fixes bug nor adds a feature
| rvt | Reverts a previous commit
| tag | When adding a tag reference
| tst | Adding missing tests or correcting existing tests
| wip | Work in progress. E.g. in case of fire

### Links
 * C4DT D-Voting GitHub fork [repository][dvoting-repo]
 * C4DT Dela GitHub fork [repository][dela-repo]
 * D-Voting [Kanban][dvoting-kanban] and [issues][dvoting-issues]
 * Current [demo][dedis-demo] hosted by dedis

[dvoting-repo]: https://github.com/c4dt/d-voting
[dela-repo]: https://github.com/c4dt/dela
[dvoting-issues]: https://github.com/c4dt/d-voting/issues
[dvoting-kanban]: https://github.com/orgs/c4dt/projects/6
[dedis-demo]: dvoting.c4dt.org


