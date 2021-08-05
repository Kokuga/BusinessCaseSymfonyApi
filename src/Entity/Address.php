<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use App\Repository\AddressRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ApiResource(
 *     collectionOperations={
            "get"={"security"="is_granted('ROLE_ADMIN')"},
            "post"={"security"="is_granted('ROLE_USER')"}
 *     },
 *     itemOperations={
 *          "get"={"security"="is_granted('ROLE_ADMIN') or object.Professionnels == user"},
 *          "put"={"security"="is_granted('ROLE_ADMIN') or object.Professionnels == user"},
 *          "patch"={"security"="is_granted('ROLE_ADMIN') or object.Professionnels == user"},
 *          "delete"={"security"="is_granted('ROLE_ADMIN') or object.Professionnels == user"},
 *     },
 * )
 * @ORM\Entity(repositoryClass=AddressRepository::class)
 */
class Address
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     * @Groups({"garage:get"})
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=50)
     * @Groups({"garage:get"})
     * @Assert\NotBlank
     * @Assert\Length(min = 2, minMessage = "Your first ligne1 must be at least {{ limit }} characters long")
     */
    private $ligne1;

    /**
     * @ORM\Column(type="string", length=50, nullable=true)
     * @Groups({"garage:get"})
     */
    private $ligne2;

    /**
     * @ORM\Column(type="string", length=50, nullable=true)
     * @Groups({"garage:get"})
     */
    private $ligne3;

    /**
     * @ORM\Column(type="string", length=6)
     * @Groups({"garage:get"})
     * @Assert\Length(
     *      min = 5,
     *      max = 6,
     *      minMessage = "Your codePostal must be at least {{ limit }} characters long",
     *      maxMessage = "Your codePostal cannot be longer than {{ limit }} characters"
     * )
     */
    private $codePostal;

    /**
     * @ORM\Column(type="string", length=50)
     * @Groups({"garage:get"})
     * @Assert\Length(
     *      min = 2,
     *      max = 50,
     *      minMessage = "Your ville must be at least {{ limit }} characters long",
     *      maxMessage = "Your ville cannot be longer than {{ limit }} characters"
     * )
     */
    private $ville;

    /**
     * @ORM\OneToOne(targetEntity=Garage::class, mappedBy="address", cascade={"persist", "remove"})
     */
    private $garage;

    public function getId(): ?int
    {
        return $this->id;
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

    public function getGarage(): ?Garage
    {
        return $this->garage;
    }

    public function setGarage(Garage $garage): self
    {
        // set the owning side of the relation if necessary
        if ($garage->getAddress() !== $this) {
            $garage->setAddress($this);
        }

        $this->garage = $garage;

        return $this;
    }
}
