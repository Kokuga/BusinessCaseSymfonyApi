<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Annotation\ApiResource;
use App\Repository\AnnonceRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Serializer\Annotation\MaxDepth;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\RangeFilter;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ApiResource(
 *     collectionOperations={
 *          "get"={"pagination_items_per_page"=5},
 *          "post"={"security"="is_granted('ROLE_USER')"},
 *     },
 *     itemOperations={
 *          "get",
 *          "put"={"security"="is_granted('ROLE_ADMIN') or object.Garage == user"},
 *          "patch"={"security"="is_granted('ROLE_ADMIN') or object.Garage == user "},
 *          "delete"={"security"="is_granted('ROLE_ADMIN') or object.Garage == user "},
 *     },
 *     normalizationContext={
 *          "groups"={"annonce:get"},
 *          "enable_max_depth" = true
 *     }
 *
 * )
 * @ORM\Entity(repositoryClass=AnnonceRepository::class)
 * @ApiFilter(SearchFilter::class, properties={"title"="partial","Carburant.id"="partial", "Modele.id"="partial", "Modele.marque.id"="partial", "refAnnonce"="partial"} )
 * @ApiFilter(RangeFilter::class, properties={"anneeCirculation", "kilometrage", "price"})
 */
class Annonce
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @Groups({"annonce:get", "garage:get", "professionnel:get"})
     * @ORM\Column(type="integer")
     */
    private $id;


    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"annonce:get", "garage:get", "professionnel:get"})
     * @Assert\Length(
     *     min = 2,
     *     minMessage = "Your first name must be at least {{ limit }} characters long",
     * )
     * @Assert\NotBlank
     */
    private $title;

    /**
     * @ORM\Column(type="text")
     * @Groups({"annonce:get", "garage:get", "professionnel:get"})
     *  @Assert\NotBlank
     */
    private $description;

    /**
     * @ORM\Column(type="integer")
     * @Groups({"annonce:get", "garage:get", "professionnel:get"})
     *  @Assert\NotBlank
     */
    private $anneeCirculation;

    /**
     * @ORM\Column(type="integer")
     * @Groups({"annonce:get", "garage:get", "professionnel:get"})
     *  @Assert\NotBlank
     */
    private $kilometrage;

    /**
     * @ORM\Column(type="decimal", precision=9, scale=2)
     * @Groups({"annonce:get", "garage:get", "professionnel:get"})
     *  @Assert\NotBlank
     */
    private $price;

    /**
     * @ORM\Column(type="string", length=50)
     * @Groups({"annonce:get", "garage:get", "professionnel:get"})
     */
    private $refAnnonce;

    /**
     * @ORM\Column(type="date")
     * @Groups({"annonce:get", "garage:get", "professionnel:get"}),
     * @Assert\Date()
     */
    private $dateAnnonce;

    /**
     * @ORM\ManyToOne(targetEntity=Garage::class, inversedBy="annonces")
     * @ORM\JoinColumn(nullable=false)
     * @MaxDepth(1)
     * @groups({"annonce:get", "garage:get"})
     */
    public $Garage;

    /**
     * @ORM\ManyToOne(targetEntity=Carburant::class, inversedBy="annonces")
     * @ORM\JoinColumn(nullable=false)
     * @Groups({"annonce:get", "garage:get"})
     *  @Assert\NotBlank
     */
    private $Carburant;

    /**
     * @ORM\ManyToOne(targetEntity=Modele::class, inversedBy="annonces")
     * @ORM\JoinColumn(nullable=false)
     * @Groups({"annonce:get", "garage:get"})
     *  @Assert\NotBlank
     */
    private $Modele;

    /**
     * @ORM\OneToMany(targetEntity=Photo::class, mappedBy="annonce", cascade={"remove"})
     * @Groups({"annonce:get", "garage:get", "professionnel:get"})
     *  @Assert\NotBlank
     */
    private $photos;

    public function __construct()
    {
        $this->photos = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): self
    {
        $this->title = $title;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getAnneeCirculation(): ?int
    {
        return $this->anneeCirculation;
    }

    public function setAnneeCirculation(int $anneeCirculation): self
    {
        $this->anneeCirculation = $anneeCirculation;

        return $this;
    }

    public function getKilometrage(): ?int
    {
        return $this->kilometrage;
    }

    public function setKilometrage(int $kilometrage): self
    {
        $this->kilometrage = $kilometrage;

        return $this;
    }

    public function getPrice(): ?float
    {
        return $this->price;
    }

    public function setPrice(float $price): self
    {
        $this->price = $price;

        return $this;
    }

    public function getRefAnnonce(): ?string
    {
        return $this->refAnnonce;
    }

    public function setRefAnnonce(string $refAnnonce): self
    {
        $this->refAnnonce = $refAnnonce;

        return $this;
    }

    public function getDateAnnonce(): ?\DateTimeInterface
    {
        return $this->dateAnnonce;
    }

    public function setDateAnnonce(\DateTimeInterface $dateAnnonce): self
    {
        $this->dateAnnonce = $dateAnnonce;

        return $this;
    }

    public function getGarage(): ?Garage
    {
        return $this->Garage;
    }

    public function setGarage(?Garage $Garage): self
    {
        $this->Garage = $Garage;

        return $this;
    }

    public function getCarburant(): ?Carburant
    {
        return $this->Carburant;
    }

    public function setCarburant(?Carburant $Carburant): self
    {
        $this->Carburant = $Carburant;

        return $this;
    }

    public function getModele(): ?Modele
    {
        return $this->Modele;
    }

    public function setModele(?Modele $Modele): self
    {
        $this->Modele = $Modele;

        return $this;
    }

    /**
     * @return Collection|Photo[]
     */
    public function getPhotos(): Collection
    {
        return $this->photos;
    }

    public function addPhoto(Photo $photo): self
    {
        if (!$this->photos->contains($photo)) {
            $this->photos[] = $photo;
            $photo->setAnnonce($this);
        }

        return $this;
    }

    public function removePhoto(Photo $photo): self
    {
        if ($this->photos->removeElement($photo)) {
            // set the owning side to null (unless already changed)
            if ($photo->getAnnonce() === $this) {
                $photo->setAnnonce(null);
            }
        }

        return $this;
    }
}
