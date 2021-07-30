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

/**
 * @ApiResource(
 *     attributes={"security"="is_granted('ROLE_USER')"},
 *
 *     itemOperations={
 *          "get"={"security"="is_granted('ROLE_ADMIN') or object.Professionnels == user"},
 *          "put"={"security"="is_granted('ROLE_ADMIN') or object.Professionnels == user"},
 *          "patch"={"security"="is_granted('ROLE_ADMIN') or object.Professionnels == user"},
 *          "delete"={"security"="is_granted('ROLE_ADMIN') or object.Professionnels == user"},
 *     },
 *     normalizationContext={
 *          "groups"={"garage:get"}, "enable_max_depth"=true
 *     }
 *     @ApiFilter(SearchFilter::class, properties={"name"="partial", "siret"="exact"})
 * )
 * @ORM\Entity(repositoryClass=GarageRepository::class)
 */
class Garage
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     * @Groups({"garage:get"})
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"garage:get"})
     */
    private $name;

    /**
     * @ORM\Column(type="string", length=10)
     * @Groups({"garage:get", "professionnel:get", "annonce:get"})
     */
    private $phone;

    /**
     * @ORM\Column(type="string", length=14)
     * @Groups({"garage:get", "professionnel:get", "annonce:get"})
     */
    private $siret;

    /**
     * @ORM\OneToOne(targetEntity=Address::class, inversedBy="garage", cascade={"persist", "remove"})
     * @ORM\JoinColumn(nullable=false)
     * @Groups({"garage:get", "professionnel:get", "annonce:get"})
     */
    private $address;

    /**
     * @ORM\OneToMany(targetEntity=Annonce::class, mappedBy="Garage")
     * @Groups({"garage:get"})
     */
    private $annonces;

    /**
     * @ORM\ManyToOne(targetEntity=Professionnel::class, inversedBy="garages")
     * @ORM\JoinColumn(nullable=false)
     *
     */
    public $Professionnels;

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

    public function getAddress(): ?Address
    {
        return $this->address;
    }

    public function setAddress(Address $address): self
    {
        $this->address = $address;

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

    public function getProfessionnels(): ?Professionnel
    {
        return $this->Professionnels;
    }

    public function setProfessionnels(?Professionnel $Professionnels): self
    {
        $this->Professionnels = $Professionnels;

        return $this;
    }
    
}
