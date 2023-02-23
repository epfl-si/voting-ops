# EPFL eVoting ops


## Purpose

The goal of this repository is to deploy a minimal eVoting service based on 
the [dvoting](https://github.com/dedis/d-voting) system with Ansible. This includes 3 conodes and a web 
frontend.

## Usage

```
#./votsible
```

### Examples

### Only on one host

```
./votsible  --prod
./votsible  --qual
./votsible  --test
#./votsible  --dev
```

### Specifying a tag

```
./votsible --test -t "test"
```

### Specifying multiple tags

```
./votsible --test -t "tag1,tag2,tag3"
```

### Skip specifying a tag

```
./votsible --test --skip-tags "github_key_import"
```

### Skip specifying multiple tags

```
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
