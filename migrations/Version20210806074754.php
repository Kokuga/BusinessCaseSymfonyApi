<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210806074754 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE garage DROP FOREIGN KEY FK_9F26610BE44D16E5');
        $this->addSql('DROP INDEX IDX_9F26610BE44D16E5 ON garage');
        $this->addSql('ALTER TABLE garage ADD professionnel_id INT DEFAULT NULL, DROP professionnels_id');
        $this->addSql('ALTER TABLE garage ADD CONSTRAINT FK_9F26610B8A49CC82 FOREIGN KEY (professionnel_id) REFERENCES professionnel (id)');
        $this->addSql('CREATE INDEX IDX_9F26610B8A49CC82 ON garage (professionnel_id)');
        $this->addSql('ALTER TABLE professionnel DROP garages');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE garage DROP FOREIGN KEY FK_9F26610B8A49CC82');
        $this->addSql('DROP INDEX IDX_9F26610B8A49CC82 ON garage');
        $this->addSql('ALTER TABLE garage ADD professionnels_id INT NOT NULL, DROP professionnel_id');
        $this->addSql('ALTER TABLE garage ADD CONSTRAINT FK_9F26610BE44D16E5 FOREIGN KEY (professionnels_id) REFERENCES professionnel (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('CREATE INDEX IDX_9F26610BE44D16E5 ON garage (professionnels_id)');
        $this->addSql('ALTER TABLE professionnel ADD garages VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT NULL COLLATE `utf8mb4_unicode_ci`');
    }
}
