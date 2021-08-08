<?php

    namespace App\Controller;

    use App\Entity\Professionnel;
    use App\Repository\ProfessionnelRepository;
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
        private ProfessionnelRepository $professionnelRepository;

        /**
         * @param EntityManagerInterface $em
         * @param UserPasswordHasherInterface $passwordHasher
         * @param ProfessionnelRepository $professionnelRepository
         */
        public function __construct(EntityManagerInterface $em, UserPasswordHasherInterface $passwordHasher, ProfessionnelRepository $professionnelRepository)
        {
            $this->em = $em;
            $this->passwordHasher = $passwordHasher;
            $this->professionnelRepository = $professionnelRepository;
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

        /**
         * @Route("/users/edit", name="users")
         */
        public function edit(Request $request): Response
        {
            $post_data = json_decode($request->getContent(), true);
            $professionnel = $this->professionnelRepository->findOneBy(['id' => $post_data['userId']]);
            if ($professionnel != null) {
                $professionnel->setUsername($post_data['username']);
                if ($post_data['password'] != null) {
                    $professionnel->setPassword($this->passwordHasher->hashPassword($professionnel, $post_data['password']));
                }
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

            } else {
                return new JsonResponse([
                    'response' => 'user not found',
                ]);
            }

        }
    }
