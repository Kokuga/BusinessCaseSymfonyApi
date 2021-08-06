<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Annotation\ApiResource;
use App\Repository\GarageRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Serializer\Annotation\MaxDepth;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ApiResource(
 *     attributes={"security"="is_granted('ROLE_USER')"},
 *
 *     itemOperations={
 *          "get"={"security"="is_granted('ROLE_ADMIN') or object.Professionnel == user"},
 *          "put"={"security"="is_granted('ROLE_ADMIN') or object.Professionnel == user"},
 *          "patch"={"security"="is_granted('ROLE_ADMIN') or object.Professionnel == user"},
 *          "delete"={"security"="is_granted('ROLE_ADMIN') or object.Professionnel == user"},
 *     },
 *     normalizationContext={
 *          "groups"={"garage:get"},
 *          "enable_max_depth" = true
 *     }
 * )
 * @ORM\Entity(repositoryClass=GarageRepository::class)
 *     @ApiFilter(SearchFilter::class, properties={"name"="partial", "siret"="exact"})
 */
class Garage
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     * @Groups({"garage:get", "professionnel:get"})
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"garage:get", "professionnel:get"})
     * @Assert\NotBlank
     * @Assert\Length(
     *      min = 2,
     *      max = 50,
     *      minMessage = "Your first name must be at least {{ limit }} characters long",
     *      maxMessage = "Your first name cannot be longer than {{ limit }} characters"
     * )
     */
    private $name;

    /**
     * @ORM\Column(type="string", length=10)
     * @Groups({"garage:get", "professionnel:get", "annonce:get"})
     * @Assert\NotBlank
     * @Assert\Length(
     *      min = 10,
     *      max = 10,
     *      minMessage = "Your phone must be at least {{ limit }} characters long",
     *      maxMessage = "Your phone cannot be longer than {{ limit }} characters"
     * )
     */
    private $phone;

    /**
     * @ORM\Column(type="string", length=14)
     * @Groups({"garage:get", "professionnel:get", "annonce:get"})
     * @Assert\NotBlank
     * @Assert\Length(
     *      min = 14,
     *      max = 14,
     *      minMessage = "Your SIRET must be at least {{ limit }} characters long",
     *      maxMessage = "Your SIRET cannot be longer than {{ limit }} characters"
     * )
     */
    private $siret;

    /**
     * @ORM\OneToMany(targetEntity=Annonce::class, mappedBy="Garage")
     * @Groups({"garage:get", "professionnel:get"})
     */
    private $annonces;

    /**
     * @ORM\ManyToOne(targetEntity=Professionnel::class, inversedBy="garages")
     * @Groups({"garage:get"})
     */
    public $Professionnel;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"garage:get", "professionnel:get", "annonce:get"})
     */
    private $ligne1;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     * @Groups({"garage:get", "professionnel:get", "annonce:get"})
     */
    private $ligne2;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     * @Groups({"garage:get", "professionnel:get", "annonce:get"})
     */
    private $ligne3;

    /**
     * @ORM\Column(type="string", length=6)
     * @Groups({"garage:get", "professionnel:get", "annonce:get"})
     */
    private $codePostal;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"garage:get", "professionnel:get", "annonce:get"})
     */
    private $ville;


    public function __construct()
    {
        $this->annonces = new ArrayCollection();
    }


    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

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

    public function getSiret(): ?string
    {
        return $this->siret;
    }

    public function setSiret(string $siret): self
    {
        $this->siret = $siret;

        return $this;
    }


    /**
     * @return Collection|Annonce[]
     */
    public function getAnnonces(): Collection
    {
        return $this->annonces;
    }

    public function addAnnonce(Annonce $annonce): self
    {
        if (!$this->annonces->contains($annonce)) {
            $this->annonces[] = $annonce;
            $annonce->setGarage($this);
        }

        return $this;
    }

    public function removeAnnonce(Annonce $annonce): self
    {
        if ($this->annonces->removeElement($annonce)) {
            // set the owning side to null (unless already changed)
            if ($annonce->getGarage() === $this) {
                $annonce->setGarage(null);
            }
        }

        return $this;
    }

    public function getProfessionnel(): ?Professionnel
    {
        return $this->Professionnel;
    }

    public function setProfessionnel(?Professionnel $Professionnel): self
    {
        $this->Professionnel = $Professionnel;

        return $this;
    }

    public function getLigne1(): ?string
    {
        return $this->ligne1;
    }

    public function setLigne1(string $ligne1): self
    {
        $this->ligne1 = $ligne1;

        return $this;
    }

    public function getLigne2(): ?string
    {
        return $this->ligne2;
    }

    public function setLigne2(?string $ligne2): self
    {
        $this->ligne2 = $ligne2;

        return $this;
    }

    public function getLigne3(): ?string
    {
        return $this->ligne3;
    }

    public function setLigne3(?string $ligne3): self
    {
        $this->ligne3 = $ligne3;

        return $this;
    }

    public function getCodePostal(): ?string
    {
        return $this->codePostal;
    }

    public function setCodePostal(string $codePostal): self
    {
        $this->codePostal = $codePostal;

        return $this;
    }

    public function getVille(): ?string
    {
        return $this->ville;
    }

    public function setVille(string $ville): self
    {
        $this->ville = $ville;

        return $this;
    }

    
}
