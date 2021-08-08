<?php

    namespace App\Controller;

    use App\Entity\Annonce;
    use App\Repository\AnnonceRepository;
    use App\Repository\CarburantRepository;
    use App\Repository\GarageRepository;
    use App\Repository\ModeleRepository;
    use Cassandra\Date;
    use DateTime;
    use Doctrine\ORM\EntityManagerInterface;
    use Monolog\DateTimeImmutable;
    use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
    use Symfony\Component\HttpFoundation\JsonResponse;
    use Symfony\Component\HttpFoundation\Request;
    use Symfony\Component\HttpFoundation\Response;
    use Symfony\Component\Routing\Annotation\Route;

    class AnnonceController extends AbstractController
    {
        private GarageRepository $garageRepository;
        private CarburantRepository $carburantRepository;
        private ModeleRepository $modeleRepository;
        private EntityManagerInterface $em;
        private AnnonceRepository $annonceRepository;

        /**
         * @param GarageRepository $garageRepository
         * @param CarburantRepository $carburantRepository
         * @param ModeleRepository $modeleRepository
         * @param EntityManagerInterface $em
         * @param AnnonceRepository $annonceRepository
         */
        public function __construct(GarageRepository $garageRepository, CarburantRepository $carburantRepository, ModeleRepository $modeleRepository, EntityManagerInterface $em, AnnonceRepository $annonceRepository)
        {
            $this->garageRepository = $garageRepository;
            $this->carburantRepository = $carburantRepository;
            $this->modeleRepository = $modeleRepository;
            $this->em = $em;
            $this->annonceRepository = $annonceRepository;
        }


        /**
         * @Route("/annonce/create", name="annonce")
         */
        public function index(Request $request): Response
        {
            $annonce = new Annonce();
            $post_data = json_decode($request->getContent(), true);
            $garage = $this->garageRepository->findOneBy(['id' => $post_data['garageId']]);
            $carburant = $this->carburantRepository->findOneBy(['id' => $post_data['carburantForm']]);
            $modele = $this->modeleRepository->findOneBy(['id' => $post_data['modeleForm']]);
            $date = new DateTime('now');
            $date->format('d-m-Y');

            $annonce->setDescription($post_data['description']);
            $annonce->setAnneeCirculation($post_data['dateCar']);
            $annonce->setKilometrage($post_data['kilometrage']);
            $annonce->setTitle($post_data['title']);
            $annonce->setPrice($post_data['price']);
            $annonce->setDateAnnonce($date);
            $annonce->setCarburant($carburant);
            $annonce->setGarage($garage);
            $annonce->setModele($modele);
            $annonce->setRefAnnonce($this->generateRandomString());

            $this->em->persist($annonce);
            $this->em->flush();

            $response = new JsonResponse();
            $response->setData(['status' => 'ok']);
            return $response;

        }

        /**
         * @Route("/annonce/edit", name="annonceedit")
         */
        public function edit(Request $request): Response
        {
            $post_data = json_decode($request->getContent(), true);
            $annonce = $this->annonceRepository->findOneBy(['id' => $post_data['annonceId']]);
            $carburant = $this->carburantRepository->findOneBy(['id' => $post_data['carburantForm']]);
            $modele = $this->modeleRepository->findOneBy(['id' => $post_data['modeleForm']]);

            $annonce->setDescription($post_data['description']);
            $annonce->setAnneeCirculation($post_data['dateCar']);
            $annonce->setKilometrage($post_data['kilometrage']);
            $annonce->setTitle($post_data['title']);
            $annonce->setPrice($post_data['price']);
            $annonce->setCarburant($carburant);
            $annonce->setModele($modele);

            $this->em->persist($annonce);
            $this->em->flush();

            $response = new JsonResponse();
            $response->setData(['status' => 'ok']);
            return $response;

        }

        public function generateRandomString($length = 10): string
        {
            $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
            $charactersLength = strlen($characters);
            $randomString = '';
            for ($i = 0; $i < $length; $i++) {
                $randomString .= $characters[rand(0, $charactersLength - 1)];
            }
            return $randomString;
        }
    }
