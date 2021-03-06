<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiFilter;
use App\Repository\ProfessionnelRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface;
use Symfony\Component\Security\Core\User\UserInterface;
use ApiPlatform\Core\Annotation\ApiResource;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Serializer\Annotation\MaxDepth;
use Symfony\Component\Validator\Constraints as Assert;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;

/**
 * @ApiResource(
 *     collectionOperations={
 *          "get"={"security"="is_granted('ROLE_USER')"},
 *          "post"={"security"="is_granted('ROLE_ADMIN')"},
 *     },

 *     itemOperations={
 *          "get"={"security"="is_granted('ROLE_ADMIN') or object == user"},
 *          "put"={"security"="is_granted('ROLE_ADMIN') or object == user"},
 *          "patch"={"security"="is_granted('ROLE_ADMIN') or object == user"},
 *          "delete"={"security"="is_granted('ROLE_ADMIN') or object == user"},
 *     },
 *     normalizationContext={
 *          "groups"={"professionnel:get"},
 *          "enable_max_depth" = true
 *     }
 * )
 * @ORM\Entity(repositoryClass=ProfessionnelRepository::class)
 * @ApiFilter(SearchFilter::class, properties={"username":"partial", "email":"partial", "phone":"partial", "first_name"="partial", "last_name"="partial"})
 */
class Professionnel implements UserInterface, PasswordAuthenticatedUserInterface
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     * @Groups({"professionnel:get", "garage:get", "annonce:get"})
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=180, unique=true)
     * @Groups({"professionnel:get", "garage:get"})
     *  @Assert\NotBlank
     * @Assert\Length(
     *     min = 2,
     *     minMessage="At least 2 characters"
     * )
     */
    private $username;

    /**
     * @ORM\Column(type="json")
     * @Groups({"professionnel:get", "garage:get"})
     *  @Assert\NotBlank
     */
    private $roles = [];

    /**
     * @var string The hashed password
     * @ORM\Column(type="string")
     * @Groups({"professionnel:get", "garage:get"})
     *  @Assert\NotBlank
     * @Assert\Length(
     *     min = 2,
     *     minMessage="At least 2 characters"
     * )
     */
    private $password;

    /**
     * @ORM\Column(type="string", length=50)
     * @Groups({"professionnel:get", "garage:get"})
     *  @Assert\NotBlank
     * @Assert\Length(
     *     min = 2,
     *     minMessage="At least 2 characters"
     * )
     */
    private $first_name;

    /**
     * @ORM\Column(type="string", length=50)
     * @Groups({"professionnel:get", "garage:get"})
     *  @Assert\NotBlank
     * @Assert\Length(
     *     min = 2,
     *     minMessage="At least 2 characters"
     * )
     */
    private $last_name;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"professionnel:get", "garage:get"})
     * @Assert\NotBlank
     * @Assert\Email(
     *     message = "The email '{{ value }}' is not a valid email."
     * )
     */
    private $email;

    /**
     * @ORM\Column(type="string", length=10)
     * @Groups({"professionnel:get", "garage:get"})
     *  @Assert\NotBlank
     * @Assert\Length(
     *     min = 10,
     *     max = 10,
     *     minMessage="limit 10 characters",
     *     maxMessage="limit 10 characters"
     * )
     */
    private $phone;

    /**
     * @ORM\OneToMany(targetEntity=Garage::class, mappedBy="Professionnel", cascade={"remove"})
     * @MaxDepth(1)
     * @Groups({"professionnel:get", "annonce:get"})
     */
    private $garages;

    public function __construct()
    {
        $this->garages = new ArrayCollection();
    }



    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * @deprecated since Symfony 5.3, use getUserIdentifier instead
     */
    public function getUsername(): string
    {
        return (string) $this->username;
    }

    public function setUsername(string $username): self
    {
        $this->username = $username;

        return $this;
    }

    /**
     * A visual identifier that represents this user.
     *
     * @see UserInterface
     */
    public function getUserIdentifier(): string
    {
        return (string) $this->username;
    }

    /**
     * @see UserInterface
     */
    public function getRoles(): array
    {
        $roles = $this->roles;
        // guarantee every user at least has ROLE_USER
        $roles[] = 'ROLE_USER';

        return array_unique($roles);
    }

    public function setRoles(array $roles): self
    {
        $this->roles = $roles;

        return $this;
    }

    /**
     * @see PasswordAuthenticatedUserInterface
     */
    public function getPassword(): string
    {
        return $this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }

    /**
     * Returning a salt is only needed, if you are not using a modern
     * hashing algorithm (e.g. bcrypt or sodium) in your security.yaml.
     *
     * @see UserInterface
     */
    public function getSalt(): ?string
    {
        return null;
    }

    /**
     * @see UserInterface
     */
    public function eraseCredentials()
    {
        // If you store any temporary, sensitive data on the user, clear it here
        // $this->plainPassword = null;
    }

    public function getFirstName(): ?string
    {
        return $this->first_name;
    }

    public function setFirstName(string $first_name): self
    {
        $this->first_name = $first_name;

        return $this;
    }

    public function getLastName(): ?string
    {
        return $this->last_name;
    }

    public function setLastName(string $last_name): self
    {
        $this->last_name = $last_name;

        return $this;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    public function getPhone(): ?string
    {
        return $this->phone;
    }

    public function setPhone(string $phone): self
    {
        $this->phone = $phone;

        return $this;
    }

    /**
     * @return Collection|Garage[]
     */
    public function getGarages(): Collection
    {
        return $this->garages;
    }

    public function addGarage(Garage $garage): self
    {
        if (!$this->garages->contains($garage)) {
            $this->garages[] = $garage;
            $garage->setProfessionnel($this);
        }

        return $this;
    }

    public function removeGarage(Garage $garage): self
    {
        if ($this->garages->removeElement($garage)) {
            // set the owning side to null (unless already changed)
            if ($garage->getProfessionnel() === $this) {
                $garage->setProfessionnel(null);
            }
        }

        return $this;
    }



}
