package com.auca.library.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import com.auca.library.model.Member;
import com.auca.library.model.MembershipRequest;
import com.auca.library.util.HibernateUtil;

import java.util.List;

public class MemberDao {
    public void saveMember(Member member) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            
            // Save the member
            session.save(member);
            
            // Create and save the membership request
            MembershipRequest request = new MembershipRequest();
            request.setMember(member);
            request.setMembershipType(member.getMembershipType());
            request.setStatus("PENDING");
            session.save(request);
            
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public Member getMemberById(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Member.class, id);
        }
    }

    public List<MembershipRequest> getPendingRequests() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<MembershipRequest> query = session.createQuery("FROM MembershipRequest WHERE status = :status", MembershipRequest.class);
            query.setParameter("status", "PENDING");
            return query.list();
        }
    }

    public void updateMembershipStatus(int requestId, String status) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();

            MembershipRequest request = session.get(MembershipRequest.class, requestId);
            if (request != null) {
                request.setStatus(status);
                
                Member member = request.getMember();
                member.setApproved("APPROVED".equals(status));
                member.setApprovalStatus(status);
                
                session.update(request);
                session.update(member);
            }

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
}