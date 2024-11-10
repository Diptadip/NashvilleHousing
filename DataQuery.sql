
Select *
From Nashville.dbo.NashvilleHousing

----------------- Standardize Date Format-----------------


Select saleDateConverted, CONVERT(Date,SaleDate)
From Nashville.dbo.NashvilleHousing

update NashvilleHousing
SET saleDate = CONVERT(Date,SaleDate)

ALTER TABLE NashvilleHousing
Add SaleDateConverted Date;

update NashvilleHousing
SET saleDateConverted = CONVERT(Date,SaleDate)


------------------------- Populate Property Address data-------------------------------

Select *
From Nashville.dbo.NashvilleHousing
--WHERE PropertyAddress is null
ORDER BY ParcelID;

select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress,
ISNULL(a.PropertyAddress,b.PropertyAddress)
from Nashville.dbo.NashvilleHousing a
join Nashville.dbo.NashvilleHousing b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID] <> b.[UniqueID]
where a.PropertyAddress is null

Update a
SET PropertyAddress = ISNULL(a.PropertyAddress,b.PropertyAddress)
From Nashville.dbo.NashvilleHousing a
JOIN Nashville.dbo.NashvilleHousing b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null

------------------------------ Breaking out Address into Individual Columns (Address, City, State)---------------------------

Select PropertyAddress
From Nashville.dbo.NashvilleHousing

SELECT
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)) as Address,
SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress)) as Address
From Nashville.dbo.NashvilleHousing

ALTER TABLE NashvilleHousing
Add PropertySplitAddress varchar(255);

update NashvilleHousing
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress));

ALTER TABLE NashvilleHousing
Add PropertySplitCity varchar(255);

update NashvilleHousing
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress));

select *
from Nashville.dbo.NashvilleHousing;



Select OwnerAddress
From Nashville.dbo.NashvilleHousing
where OwnerAddress is null

ALTER TABLE NashvilleHousing
ADD OwnerAddressConverted NVARCHAR(255);

UPDATE NashvilleHousing 
SET OwnerAddressConverted = 
    CASE 
        WHEN OwnerAddress IS NOT NULL THEN SUBSTRING(OwnerAddress, 2, LEN(OwnerAddress) - 2)
        ELSE NULL
    END;

select OwnerAddressConverted
from Nashville.dbo.NashvilleHousing;


ALTER TABLE NashvilleHousing
Add OwnerSplitAddress Nvarchar(255);

Update NashvilleHousing
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddressConverted, ',', '.') , 3)


ALTER TABLE NashvilleHousing
Add OwnerSplitCity Nvarchar(255);

Update NashvilleHousing
SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddressConverted, ',', '.') , 2)



ALTER TABLE NashvilleHousing
Add OwnerSplitState Nvarchar(255);

Update NashvilleHousing
SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddressConverted, ',', '.') , 1)

select *
from Nashville.dbo.NashvilleHousing;

------------------------------------------------ Remove Duplicates-------------------------------------

WITH RowNumCTE AS(
Select *,
	ROW_NUMBER() OVER (
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY
					UniqueID
					) row_num

From Nashville.dbo.NashvilleHousing
--order by ParcelID
)
select *
From RowNumCTE
Where row_num > 1
Order by PropertyAddress

-----------------------------------------Delete Unused Columns----------------------------------------------

Select *
From Nashville.dbo.NashvilleHousing


ALTER TABLE Nashville.dbo.NashvilleHousing
DROP COLUMN TaxDistrict, SaleDate, PropertyAddress, OwnerAddress, OwnerAddressConverted