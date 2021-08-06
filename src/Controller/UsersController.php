<?php

namespace App\Controller;

use App\Entity\Professionnel;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\PasswordHasher\PasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;

class UsersController extends AbstractController
{

    private EntityManagerInterface $em;

    private UserPasswordHasherInterface $passwordHasher;

    /**
     * @param EntityManagerInterface $em
     * @param UserPasswordHasherInterface $passwordHasher
     */
    public function __construct(EntityManagerInterface $em, UserPasswordHasherInterface $passwordHasher)
    {
        $this->em = $em;
        $this->passwordHasher = $passwordHasher;
    }


    /**
     * @Route("/users/create", name="users")
     */
    public function index(Request $request): Response
    {
        $professionnel = new Professionnel();
        $post_data = json_decode($request->getContent(), true);

        $professionnel->setUsername($post_data['username']);
        $professionnel->setPassword($this->passwordHasher->hashPassword($professionnel, $post_data['password']));
        $professionnel->setPhone($post_data['phone']);
        $professionnel->setEmail($post_data['email']);
        $professionnel->setFirstName($post_data['firstName']);
        $professionnel->setLastName($post_data['lastName']);
        $professionnel->setRoles($post_data['roles']);

        $this->em->persist($professionnel);
        $this->em->flush();

        return new JsonResponse([
            'response' => 'ok',
        ]);

    }
}
