#lang sicp

(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    
    (define (set-front-ptr! item)
      (set! front-ptr item))
    
    (define (set-rear-ptr! item)
      (set! rear-ptr item))
    
    (define (empty-queue?)
      (null? front-ptr))
    
    (define (front-queue)
      (if (empty-queue?)
          (error "FRONT called with an empty queue")
          (car front-ptr)))
    
    (define (insert-queue! item)
      (let ((new-pair (cons item '())))
        (cond ((empty-queue?)
               (set-front-ptr! new-pair)
               (set-rear-ptr! new-pair)
               front-ptr)
              (else
               (set-cdr! rear-ptr new-pair)
               (set-rear-ptr! new-pair)
               front-ptr))))
    
    (define (delete-queue!)
      (cond ((empty-queue?)
             (error "DELETE called with an empty queue"))
            (else
             (set-front-ptr! (cdr front-ptr))
             front-ptr)))
    
    (define (dispatch m)
      (cond ((eq? m 'front-ptr) front-ptr)
            ((eq? m 'rear-ptr) rear-ptr)
            ((eq? m 'set-front-ptr!) (set-front-ptr!))
            ((eq? m 'set-rear-ptr!) (set-rear-ptr!))
            ((eq? m 'empty-queue?) (empty-queue?))
            ((eq? m 'front-queue) (front-queue))
            ((eq? m 'insert-queue!) insert-queue!)
            ((eq? m 'delete-queue!) (delete-queue!))
            (else (error "Unknown command" m))))
    dispatch))

(define q (make-queue))
((q 'insert-queue!) 'a)
((q 'insert-queue!) 'b)
(q 'front-ptr)
(q 'rear-ptr)
(q 'empty-queue?)
(q 'delete-queue!)
(q 'front-ptr)
(q 'delete-queue!)
(q 'front-ptr)
(q 'empty-queue?)