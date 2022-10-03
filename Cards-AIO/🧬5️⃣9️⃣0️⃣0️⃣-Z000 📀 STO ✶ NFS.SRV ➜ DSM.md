```
	🔶 Share Folder permission 
	
			share folder >> edit >> Permission 
					guest : read only 
	
	
	🔶 Config NFS
	
			share folder >> edit >> nfs permissions >> create 
					ip:          10.1.1.0/24 
					Privillege:  read only 
					squash:      map all users to guest 
					security:    sys 
					check all other.
	
	
	🔶 NFS version 
	
			dsm: file servers: nfs:  max nfs choose nfsv4.
	
	
	
	🔶 Note:  dsm7 + esxi7  no work on nfs4.  so use nfs3.
	
