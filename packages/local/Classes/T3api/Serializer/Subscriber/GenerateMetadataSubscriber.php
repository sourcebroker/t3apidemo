<?php

namespace V\Local\T3api\Serializer\Subscriber;

use JMS\Serializer\EventDispatcher\Events;
use JMS\Serializer\EventDispatcher\EventSubscriberInterface;
use JMS\Serializer\EventDispatcher\ObjectEvent;
use JMS\Serializer\JsonSerializationVisitor;
use JMS\Serializer\Metadata\StaticPropertyMetadata;
use SourceBroker\T3api\Domain\Repository\ApiResourceRepository;
use TYPO3\CMS\Extbase\DomainObject\AbstractDomainObject;
use TYPO3\CMS\Extbase\Object\ObjectManager;

class GenerateMetadataSubscriber implements EventSubscriberInterface
{

    /** @var ApiResourceRepository */
    protected $apiResourceRepository;

    /** @var ObjectManager */
    protected $objectManager;

    public function injectApiResourceRepository(ApiResourceRepository $apiResourceRepository): void
    {
        $this->apiResourceRepository = $apiResourceRepository;
    }

    public function injectObjectManager(ObjectManager $objectManager): void
    {
        $this->objectManager = $objectManager;
    }

    public static function getSubscribedEvents(): array
    {
        return [
            [
                'event' => Events::POST_SERIALIZE,
                'method' => 'onPostSerialize',
            ],
        ];
    }

    public function onPostSerialize(ObjectEvent $event): void
    {
        if (!$event->getObject() instanceof AbstractDomainObject) {
            return;
        }

        $entity = $event->getObject();
        $visitor = $event->getVisitor();

        $this->addType($entity, $visitor);
    }

    protected function addType(AbstractDomainObject $entity, JsonSerializationVisitor $visitor): void
    {
        $type = str_replace('\Domain\Model','', get_class($entity));
        $visitor->visitProperty(
            new StaticPropertyMetadata(AbstractDomainObject::class, '@type', $type),
            $type
        );
    }

}
