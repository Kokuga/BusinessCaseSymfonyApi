<?php

namespace App\Controller;

use App\Entity\Garage;
use App\Entity\Professionnel;
use App\Repository\ProfessionnelRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class GarageController extends AbstractController
{
    private EntityManagerInterface $em;
    private ProfessionnelRepository $professionnel;

    /**
     * @param EntityManagerInterface $em
     * @param ProfessionnelRepository $professionnel
     */
    public function __construct(EntityManagerInterface $em, ProfessionnelRepository $professionnel)
    {
        $this->em = $em;
        $this->professionnel = $professionnel;
    }


    /**
     * @Route("/garage/create", name="garage")
     */
    public function index(Request $request): Response
    {
        $garage = new Garage();
        $post_data = json_decode($request->getContent(), true);
        $user = $this->professionnel->findOneBy(['id' => $post_data['userId']]);
        $garage->setName($post_data['name']);
        $garage->setPhone($post_data['phone']);
        $garage->setSiret($post_data['siret']);
        $garage->setLigne1($post_data['ligne1']);
        $garage->setLigne2($post_data['ligne2']);
        $garage->setLigne3($post_data['ligne3']);
        $garage->setCodePostal($post_data['codePostal']);
        $garage->setVille($post_data['ville']);
        $garage->setProfessionnel($user);



        $this->em->persist($garage);
        $this->em->flush();

        return new JsonResponse([
            'response' => 'ok',
        ]);
    }
}
