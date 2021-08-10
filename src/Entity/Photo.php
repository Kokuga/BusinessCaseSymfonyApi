<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use App\Repository\PhotoRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ApiResource(
 *     collectionOperations={
            "get"={"security"="is_granted('ROLE_ADMIN') or object.annonce.Garage.Professionnels == user"},
 *          "post"={"security"="is_granted('ROLE_USER')"}
 *
 *     },
 *
 *    itemOperations={
 *          "get"={"security"="is_granted('ROLE_ADMIN') or object.annonce.Garage.Professionnels == user"},
 *          "put"={"security"="is_granted('ROLE_ADMIN') or object.annonce.Garage.Professionnels == user"},
 *          "patch"={"security"="is_granted('ROLE_ADMIN') or object.annonce.Garage.Professionnels == user"},
 *          "delete"={"security"="is_granted('ROLE_ADMIN') or object.annonce.Garage.Professionnels == user"},
 *     },
 * )
 * @ORM\Entity(repositoryClass=PhotoRepository::class)
 */
class Photo
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"annonce:get", "garage:get", "professionnel:get"})
     * @Assert\Length(
     *     min = 2,
     *     minMessage="At least 2 characters"
     * )
     */
    private $path;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"annonce:get", "garage:get", "professionnel:get"})
     * @Assert\Length(
     *     min = 2,
     *     minMessage="At least 2 characters"
     * )
     */
    private $name;

    /**
     * @ORM\ManyToOne(targetEntity=Annonce::class, inversedBy="photos")
     * @ORM\JoinColumn(nullable=false)
     */
    private $annonce;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getPath(): ?string
    {
        return $this->path;
    }

    public function setPath(string $path): self
    {
        $this->path = $path;

        return $this;
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

    public function getAnnonce(): ?Annonce
    {
        return $this->annonce;
    }

    public function setAnnonce(?Annonce $annonce): self
    {
        $this->annonce = $annonce;

        return $this;
    }
}
