function release_commits
    git log origin/production..(git rev-parse --abbrev-ref HEAD) --format='%h - %ad - %s %aN' --date=format:'%b %d %Y' | tail -r | sed 's/^/- /'
end