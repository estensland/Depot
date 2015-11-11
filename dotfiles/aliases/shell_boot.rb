require '~/coding/MeadHall/dotfiles/aliases/chamberlain/chamberlain.rb'


lists = [
  [
    {
      name: 'Basic',
      aliases:{
        reshell: "source ~/.bash_profile",
        '..' => "cd ..",
        '...' => "cd ...",
        lg: "ls -G",
        la: "ls -AF",
        ll: "ls -alh",
        l: "ls -a",
        l1: "ls -1",
        lo: "ls -l | sed -e 's/--x/1/g' -e 's/-w-/2/g' -e 's/-wx/3/g' -e 's/r--/4/g' -e 's/r-x/5/g' -e 's/rw-/6/g' -e 's/rwx/7/g' -e 's/---/0/g'",
        recent: "ls -lAt | head",
        old: "ls -lAt | tail"
      }
    },
    {
      name: 'Custom',
      aliases: {
        bashprof: "subl ~/.bash_profile",
        coding: "cd ~/coding",
        mh: "cd ~/coding/MeadHall",
        rfiles: "cd ~/coding/ruby_files",
        wp: "cd ~/coding/web_projects",
        exer: "cd ~/coding/exercism.io",
        euler: "cd ~/coding/euler",
        emberp: "cd ~/coding/ember_projects",
        ngp: "cd ~/coding/angular_projects",
        jsp: "cd ~/coding/js_projects",
        phpp: "cd ~/coding/php_projects",
        rp: "cd ~/coding/rails_projects",
        rpg: "cd ~/coding/rails_projects/gems",
        gene: "cd ~/coding/rails_projects/genealogy_test"
      }
    },
    {

      name: 'Git',
      aliases: {
        g: "git",
        gi: "git init",
        ga: "git add",
        gap: "git add --all -p",
        gb: "git branch",
        gco: "git checkout",
        gs: "git status",
        gss: "git status -s",
        gd: "git diff",
        gdc: "git diff --cached",
        gr: "git pull --rebase",
        gv: "git remote -v",
        ggph: "gph && gobranch",
        mikedrop: "git push origin master",
        choochoo: "git push origin master --force",
        hitme: "git pull origin master",
        cmdz: "git reset --soft HEAD~1"
      },
      quoted_inputs: {
        gac: "git add . ; git commit -m",
        gc: "git commit -m",
      }
    },
    {
      name: 'Bundler',
      aliases: {
        b: "bundle",
        bi: "bundle install --path vendor",
        be: "bundle exec",
        bl: "bundle list",
        bu: "bundle update",
        bp: "bundle package"
      }
    },
    {
      name: 'Rails',
      aliases: {
        rc: "rails console",
        rgm: "rails generate model",
        rn: "rails new",
        rs: "rails server",
        rt: "bundle exec rspec spec --format documentation",
      }
    },
    {
      name: 'Heroku',
      aliases: {
        hl: 'heroku list',
        hi: 'heroku info',
        ho: 'heroku open',
        hr: 'heroku rake',
        hcon: 'heroku console',
        hnew: 'heroku create',
        hrestart: 'heroku restart',
        hlog: 'heroku logs',
        hc: 'heroku config',
        hca: 'heroku config:add',
        hcr: 'heroku config:remove',
        hcc: 'heroku config:clear'
      }
    }
  ]
]


Chamberlain.new(alias_lists: lists)

