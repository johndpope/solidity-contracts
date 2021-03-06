pragma solidity ^0.4.21;

import "./item_store_interface.sol";
import "./item_store_ipfs_sha256.sol";


/**
 * @title ItemStoreIpfsSha256Proxy
 * @author Jonathan Brown <jbrown@mix-blockchain.org>
 * @dev Proxy contract for accessing a ItemStoreIpfsSha256Proxy contract from a different address for testing purposes.
 */
contract ItemStoreIpfsSha256Proxy is ItemStoreInterface {

    ItemStoreIpfsSha256 itemStore;

    /**
     * @dev Constructor.
     * @param _itemStore Real ItemStore contract to proxy to.
     */
    function ItemStoreIpfsSha256Proxy(ItemStoreIpfsSha256 _itemStore) public {
        itemStore = _itemStore;
    }

    /**
     * @dev Generates an itemId from sender and nonce and checks that it is unused.
     * @param nonce Nonce that this sender has never used before.
     * @return itemId itemId of the item with this sender and nonce.
     */
    function getNewItemId(bytes32 nonce) external view returns (bytes32 itemId) {
        itemId = itemStore.getNewItemId(nonce);
    }

    /**
     * @dev Add a child from another item store contract.
     * @param itemId itemId of parent.
     * @param child itemId of child.
     */
    function addForeignChild(bytes32 itemId, bytes32 child) external {
        itemStore.addForeignChild(itemId, child);
    }

    /**
     * @dev Create a new item revision.
     * @param itemId itemId of the item.
     * @param ipfsHash Hash of the IPFS object where the item revision is stored.
     * @return revisionId The new revisionId.
     */
    function createNewRevision(bytes32 itemId, bytes32 ipfsHash) external returns (uint revisionId) {
        revisionId = itemStore.createNewRevision(itemId, ipfsHash);
    }

    /**
     * @dev Update an item's latest revision.
     * @param itemId itemId of the item.
     * @param ipfsHash Hash of the IPFS object where the item revision is stored.
     */
    function updateLatestRevision(bytes32 itemId, bytes32 ipfsHash) external {
        itemStore.updateLatestRevision(itemId, ipfsHash);
    }

    /**
     * @dev Retract an item's latest revision. Revision 0 cannot be retracted.
     * @param itemId itemId of the item.
     */
    function retractLatestRevision(bytes32 itemId) external {
        itemStore.retractLatestRevision(itemId);
    }

    /**
     * @dev Delete all an item's revisions and replace it with a new item.
     * @param itemId itemId of the item.
     * @param ipfsHash Hash of the IPFS object where the item revision is stored.
     */
    function restart(bytes32 itemId, bytes32 ipfsHash) external {
        itemStore.restart(itemId, ipfsHash);
    }

    /**
     * @dev Retract an item.
     * @param itemId itemId of the item. This itemId can never be used again.
     */
    function retract(bytes32 itemId) external {
        itemStore.retract(itemId);
    }

    /**
     * @dev Transfer an item to a new user.
     * @param itemId itemId of the item.
     * @param recipient Address of the user to transfer to item to.
     */
    function transfer(bytes32 itemId, address recipient) external {
        itemStore.transfer(itemId, recipient);
    }

    /**
     * @dev Disown an item.
     * @param itemId itemId of the item.
     */
    function disown(bytes32 itemId) external {
        itemStore.disown(itemId);
    }

    /**
     * @dev Set an item to enforce revisions.
     * @param itemId itemId of the item.
     */
    function setEnforceRevisions(bytes32 itemId) external {
        itemStore.setEnforceRevisions(itemId);
    }

    /**
     * @dev Set an item to not be retractable.
     * @param itemId itemId of the item.
     */
    function setNotRetractable(bytes32 itemId) external {
        itemStore.setNotRetractable(itemId);
    }

    /**
     * @dev Set an item to not be transferable.
     * @param itemId itemId of the item.
     */
    function setNotTransferable(bytes32 itemId) external {
        itemStore.setNotTransferable(itemId);
    }

    /**
     * @dev Enable transfer of an item to the current user.
     * @param itemId itemId of the item.
     */
    function transferEnable(bytes32 itemId) external {
        itemStore.transferEnable(itemId);
    }

    /**
     * @dev Disable transfer of an item to the current user.
     * @param itemId itemId of the item.
     */
    function transferDisable(bytes32 itemId) external {
        itemStore.transferDisable(itemId);
    }

    /**
     * @dev Set an item as not updatable.
     * @param itemId itemId of the item.
     */
    function setNotUpdatable(bytes32 itemId) external {
        itemStore.setNotUpdatable(itemId);
    }



    /**
     * @dev Get the ABI version for this ItemStore contract.
     * @return ABI version.
     */
    function getAbiVersion() external view returns (uint) {
        return itemStore.getAbiVersion();
    }

    /**
     * @dev Get the id for this ItemStore contract.
     * @return Id of the contract.
     */
    function getContractId() external view returns (bytes8) {
        return itemStore.getContractId();
    }

    /**
     * @dev Check if an itemId is in use.
     * @param itemId itemId of the item.
     * @return True if the itemId is in use.
     */
    function getInUse(bytes32 itemId) external view returns (bool) {
        return itemStore.getInUse(itemId);
    }

    /**
     * @dev Determine if an item is updatable.
     * @param itemId itemId of the item.
     * @return True if the item is updatable.
     */
    function getUpdatable(bytes32 itemId) external view returns (bool) {
        return itemStore.getUpdatable(itemId);
    }

    /**
     * @dev Determine if an item enforces revisions.
     * @param itemId itemId of the item.
     * @return True if the item enforces revisions.
     */
    function getEnforceRevisions(bytes32 itemId) external view returns (bool) {
        return itemStore.getEnforceRevisions(itemId);
    }

    /**
     * @dev Determine if an item is retractable.
     * @param itemId itemId of the item.
     * @return True if the item is item retractable.
     */
    function getRetractable(bytes32 itemId) external view returns (bool) {
        return itemStore.getRetractable(itemId);
    }

    /**
     * @dev Determine if an item is transferable.
     * @param itemId itemId of the item.
     * @return True if the item is transferable.
     */
    function getTransferable(bytes32 itemId) external view returns (bool) {
        return itemStore.getTransferable(itemId);
    }

    /**
     * @dev Get the owner of an item.
     * @param itemId itemId of the item.
     * @return Owner of the item.
     */
    function getOwner(bytes32 itemId) external view returns (address) {
        return itemStore.getOwner(itemId);
    }

    /**
     * @dev Get the number of revisions an item has.
     * @param itemId itemId of the item.
     * @return How many revisions the item has.
     */
    function getRevisionCount(bytes32 itemId) external view returns (uint) {
        return itemStore.getRevisionCount(itemId);
    }

    /**
     * @dev Get the number of parents an item has.
     * @param itemId itemId of the item.
     * @return How many parents the item has.
     */
    function getParentCount(bytes32 itemId) external view returns (uint) {
        return itemStore.getParentCount(itemId);
    }

    /**
     * @dev Get a specific parent
     * @param itemId itemId of the item.
     * @param i Index of the parent.
     * @return itemId of the parent.
     */
    function getParentId(bytes32 itemId, uint i) external view returns (bytes32) {
        return itemStore.getParentId(itemId, i);
    }

    /**
     * @dev Get the number of children an item has.
     * @param itemId itemId of the item.
     * @return How many children the item has.
     */
    function getChildCount(bytes32 itemId) external view returns (uint) {
        return itemStore.getChildCount(itemId);
    }

    /**
     * @dev Get a specific child
     * @param itemId itemId of the item.
     * @param i Index of the child.
     * @return itemId of the child.
     */
    function getChildId(bytes32 itemId, uint i) external view returns (bytes32) {
        return itemStore.getChildId(itemId, i);
    }

}
