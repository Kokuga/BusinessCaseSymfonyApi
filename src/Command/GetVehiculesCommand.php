<?php

    namespace App\Command;

    use App\Entity\Marque;
    use App\Entity\Modele;
    use App\Repository\MarqueRepository;
    use App\Repository\ModeleRepository;
    use Doctrine\ORM\EntityManagerInterface;
    use Symfony\Component\Console\Command\Command;
    use Symfony\Component\Console\Input\InputArgument;
    use Symfony\Component\Console\Input\InputInterface;
    use Symfony\Component\Console\Input\InputOption;
    use Symfony\Component\Console\Output\OutputInterface;
    use Symfony\Component\Console\Style\SymfonyStyle;
    use Symfony\Contracts\HttpClient\HttpClientInterface;

    class GetVehiculesCommand extends Command
    {
        protected static $defaultName = 'app:getVehicules';

        private MarqueRepository $marqueRepository;
        private ModeleRepository $modeleRepository;
        private HttpClientInterface $client;
        private EntityManagerInterface $em;

        /**
         * @param MarqueRepository $marqueRepository
         * @param ModeleRepository $modeleRepository
         * @param HttpClientInterface $client
         * @param EntityManagerInterface $em
         */
        public function __construct(MarqueRepository $marqueRepository, ModeleRepository $modeleRepository, HttpClientInterface $client, EntityManagerInterface $em)
        {
            parent::__construct();
            $this->marqueRepository = $marqueRepository;
            $this->modeleRepository = $modeleRepository;
            $this->client = $client;
            $this->em = $em;
        }


        protected function configure(): void
        {
            $this->addArgument('limit', InputArgument::REQUIRED);
        }

        protected function execute(InputInterface $input, OutputInterface $output): int
        {
            $limit = $input->getArgument('limit');
            $countMarque = 0;
            $countModele = 0;

            $response = $this->client->request('GET', 'https://parseapi.back4app.com/classes/Car_Model_List?limit='.$limit.'&keys=Make,Model', [
                'headers' => [
                    'X-Parse-Application-Id: hlhoNKjOvEhqzcVAJ1lxjicJLZNVv36GdbboZj3Z',
                    'X-Parse-Master-Key: SNMJJF0CZZhTPhLDIqGhTlUNV9r60M2Z5spyWfXW'
                ]
            ]);

            $content = $response->toArray();
            foreach ($content['results'] as $data) {
                $marqueEntity = $this->marqueRepository->findOneBy(['nom' => $data['Make']]);
                if ($marqueEntity === null) {
                    $marque = new Marque();
                    $marque->setNom($data['Make']);
                    $countMarque++;
                    $this->em->persist($marque);
                    $this->em->flush();

                }
                $modeleEntity = $this->modeleRepository->findOneBy(['name' => $data['Model']]);
                if ($modeleEntity === null) {
                    $marqueEntity = $this->marqueRepository->findOneBy(['nom' => $data['Make']]);
                    $modele = new Modele();
                    $modele->setName($data['Model']);
                    $modele->setMarque($marqueEntity);
                    $countModele++;
                    $this->em->persist($modele);
                    $this->em->flush();

                }


            }

            $output->writeln($countMarque . ' marques et ' . $countModele . ' modeles ont été ajoutés avec succes');

            return Command::SUCCESS;
        }
    }
