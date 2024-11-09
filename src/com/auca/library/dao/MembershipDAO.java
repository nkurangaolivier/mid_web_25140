package com.auca.library.dao;

import com.auca.library.model.MembershipRequest;
import com.auca.library.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import javax.persistence.Query;
import java.util.List;

public class MembershipDAO {
    
    public void createMembershipRequest(MembershipRequest request) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(request);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            throw e;
        }
    }

    public List<MembershipRequest> getPendingRequests() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query query = session.createQuery(
                "FROM MembershipRequest mr WHERE mr.status = :status", 
                MembershipRequest.class
            );
            query.setParameter("status", "PENDING");
            return query.getResultList();
        }
    }

    public void updateMembershipStatus(int requestId, String status) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            
            MembershipRequest request = session.get(MembershipRequest.class, requestId);
            if (request != null) {
                request.setStatus(status);
                session.update(request);
                
                // If approved, update member's membership
                if ("APPROVED".equals(status) && request.getMember() != null) {
                    request.getMember().setMembershipType(request.getMembershipType());
                    session.update(request.getMember());
                }
            }
            
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            throw e;
        }
    }

    public boolean hasExistingRequest(int memberId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query query = session.createQuery(
                "SELECT COUNT(mr) FROM MembershipRequest mr " +
                "WHERE mr.memberId = :memberId AND mr.status = :status"
            );
            query.setParameter("memberId", memberId);
            query.setParameter("status", "PENDING");
            Long count = (Long) query.getSingleResult();
            return count > 0;
        }
    }

    public MembershipRequest getMembershipRequest(int requestId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(MembershipRequest.class, requestId);
        }
    }

	public void approveMembership(int userId, String membershipType) {
		// TODO Auto-generated method stub
		
	}
}