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
        // GET: Cart
        public ActionResult Index()
        {
           
            var cart = Session["cart"] as List<RequestItemDTO> ?? new List<RequestItemDTO>();

          
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

            RequestItemDTO request = new RequestItemDTO();
            int qty = 0;
    
            if (Session["cart"] != null)
            {
                var list = (List<RequestItemDTO>)Session["cart"];

          
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
            List<RequestItemDTO> cart = Session["cart"] as List<RequestItemDTO> ?? new List<RequestItemDTO>();
      

            // Init CartVM
            RequestItemDTO model = new RequestItemDTO();
            string SessionId = HttpContext.Session.SessionID;

            // Get the product
            Product product = db.Find(id);


            var productInCart = cart.FirstOrDefault(x => x.ProductId == id);

            if (productInCart == null)
            {
                cart.Add(new RequestItemDTO()
                {
                    ProductId = product.Id,
                    ProductCode = product.item_code,
                    ProductDescription = product.Description,
                    Metric = product.UnitsId,
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
                Debug.WriteLine(SessionId);
                
            }

            model.Qty = qty;

            // Save cart back to session
            Session["cart"] = cart;

            // Return partial view with model
            return PartialView(model);
        }

        public JsonResult ProdIncrement(int productId)
        {
            List<RequestItemDTO> cart = Session["cart"] as List<RequestItemDTO>;

             RequestItemDTO item = cart.FirstOrDefault(x => x.ProductId == productId);

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
            List<RequestItemDTO> cart = Session["cart"] as List<RequestItemDTO>;

            RequestItemDTO item = (cart ?? throw new InvalidOperationException()).FirstOrDefault(x => x.ProductId == productId);

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
    }
}