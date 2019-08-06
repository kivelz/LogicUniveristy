using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using storemanagement.Models;
using storemanagement.Models.DTO;
using storemanagement.DAL;

namespace storemanagement.Controllers
{
    public class CartController : Controller
    {
        private ProductDAL db = new ProductDAL();
        private UserDAL user = new UserDAL();
        private RequestDal requestdal = new RequestDal();
        private RequestDetailsContext detailContext = new RequestDetailsContext();
        // GET: Cart
        public ActionResult Index()
        {
           
            var cart = Session["cart"] as List<RequisitionDTO> ?? new List<RequisitionDTO>();

          
            if (cart.Count == 0 || Session["cart"] == null)
            {
                ViewBag.Message = "Your cart is empty.";
               
                return View();
            }

            int qty = 0;

            foreach (var item in cart)
            {
                qty += item.Qty;
            }
            ViewBag.TotalQty = qty;
            return View(cart);


        }

        public ActionResult CartPartial()
        {

            RequisitionDTO request = new RequisitionDTO();
            int qty = 0;
    
            if (Session["cart"] != null)
            {
                var list = (List<RequisitionDTO>)Session["cart"];

          
                foreach (var item in list)
                {
                    qty += item.Qty;
                }
                request.Qty = qty;

            }
            else
            {
                request.Qty = 0;
            }
            return PartialView(request);
        }

        public ActionResult AddToCart(int id)
        {
          //POst cart
            List<RequisitionDTO> cart = Session["cart"] as List<RequisitionDTO> ?? new List<RequisitionDTO>();
      

            // Init CartVM
            RequisitionDTO model = new RequisitionDTO();
           

            // Get the product
            Product product = db.Find(id);


            var productInCart = cart.FirstOrDefault(x => x.ProductId == id);

            if (productInCart == null)
            {
                cart.Add(new RequisitionDTO()
                {
                    ProductId = product.Id,
                    ProductCode = product.item_code,
                    ProductDescription = product.Description,
                    Metric = product.Unit.name,
                    Qty = 1,
                  
                });
            }
            else
            {
                // If it is, increment
                productInCart.Qty++;
          
            }


            // Get total qty and price and add to model

            int qty = 0;

            foreach (var item in cart)
            {
                qty += item.Qty;

            }

            model.Qty = qty;

            // Save cart back to session
            Session["cart"] = cart;

            // Return partial view with model
            return PartialView(model);
        }

        public JsonResult ProdIncrement(int productId)
        {
            List<RequisitionDTO> cart = Session["cart"] as List<RequisitionDTO>;

             RequisitionDTO item = cart.FirstOrDefault(x => x.ProductId == productId);

             if (item != null)
             {
                 item.Qty++;
            }
             
            var result = new {qty = item.Qty};

            return Json(result, JsonRequestBehavior.AllowGet);
            
        }

        //Produce decrement
        public JsonResult ProdDecrement(int productId)
        {
            List<RequisitionDTO> cart = Session["cart"] as List<RequisitionDTO>;

            RequisitionDTO item = (cart ?? throw new InvalidOperationException()).FirstOrDefault(x => x.ProductId == productId);

            if (item.Qty > 1)
            {
                item.Qty--;
            }
            else
            {
                item.Qty = 0;
                cart.Remove(item);
            }

            var result = new {qty = item.Qty};

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public void RemoveProduct(int productId)
        {
            List<RequisitionDTO> cart = Session["cart"] as List<RequisitionDTO>;

            RequisitionDTO item = (cart ?? throw new InvalidOperationException()).FirstOrDefault(x => x.ProductId == productId);

            cart.Remove(item);

        }

        [HttpPost]
        public void RequestOrder()
        {
            List<RequisitionDTO> cart = Session["cart"] as List<RequisitionDTO>;

            Employee emp = new Employee();
            RequestDetails requestDetails = new RequestDetails();
            Session["UserId"] = emp;

            string name = emp.name;
            string email = emp.email;
            string dept = user.DeptName(emp);

            requestDetails.empName = name;
            requestDetails.empEmail = email;
            requestDetails.deptName = dept;
            requestDetails.remarks = "";
            requestDetails.status = "Pending";
            requestDetails.approvalDate = null;
            requestDetails.requestDate = DateTime.Now;

            detailContext.Add(requestDetails);
            detailContext.Save(requestDetails);


            Request requester = new Request();

            foreach (var item in cart)
            {
                requester.productId = item.ProductId;
                requester.productCat = item.ProductCode;
                requester.productDesc = item.ProductDescription;
                requester.qty = item.Qty;
                
                requestdal.Add(requester);
                requestdal.Save(requester);
            }


        }
    }
}