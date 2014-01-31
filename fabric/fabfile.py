from fabric.api import local

def copy_live_db():
    local("mysql librivox_catalog < /root/catalog.sql")

def migration_users():
    local("php ../public_html/index.php scripts migration_users index 1")

def migration_authors(stage=0):
    local("php ../public_html/index.php scripts migration_authors index %s")

def migration_main(stage=0):
    local("php ../public_html/index.php scripts migration_main index %s")

def migration_sections(stage=0):
    local("php ../public_html/index.php scripts migration_sections index %s")

def migration_html():
    local("php ../public_html/index.php scripts migration_html update ")

def migration_coverart():
    local("php ../public_html/index.php scripts migration_coverart index")

def migration_genres():
    local("php ../public_html/index.php scripts migration_genres index")

def migration_keywords():
    local("php ../public_html/index.php scripts migration_keywords index") 

def data_migration():
    local("php ../public_html/index.php scripts data_migration transfer_data") 
           


def prepare_deploy():
    copy_live_db()
    migration_users()
    migration_authors(1)
    migration_authors(2)
    migration_authors(3)
    migration_main(1)
    migration_main(2)
    migration_main(3)
    migration_main(4)
    migration_sections(1)
    migration_sections(2)
    migration_sections(3)
    migration_sections(4)
    migration_sections(5)
    migration_sections(6)
    migration_sections(7)
    migration_html()
    migration_coverart()
    migration_genres()
    migration_keywords()
    #data_migration()
